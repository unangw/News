//
//  ArticleCoordinator.swift
//  News
//
//  Created by BTS.id on 02/03/26.
//

import UIKit
import Foundation

protocol ArticleCoordinatorProtocol: Coordinator {
    func showArticleViewController()
}

class ArticleCoordinator: NSObject, ArticleCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var type: CoordinatorType { .article }
    
    var source: SourceItemModel?
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        super.init()
        
        self.navigationController.delegate = self
    }
    
    deinit {
        print("ArticleCoordinator deinit")
    }
    
    func start() {
        showArticleViewController()
    }
    
    func showArticleViewController() {
        let articleVC: ListArticleViewController = .init(viewModel: ArticleInjection.provideArticleViewModel())
        
        articleVC.source = source
        articleVC.didSendEventClosure = { [weak self] event in
            switch event {
            case .article:
                self?.navigationController.popViewController(animated: true)
                
                self?.finish()
            case .articleDetail(let article):
                self?.showArticleDetailsViewController(article: article)
            }
        }
        
        navigationController.pushViewController(articleVC, animated: true)
    }
    
    func showArticleDetailsViewController(article: ArticleItemModel) {
        let articleDetailVC: ArticleDetailViewController = ArticleDetailViewController()
        
        articleDetailVC.article = article
        articleDetailVC.didSendEventClosure = { [weak self] event in
            switch event {
            case .articleDetail:
                self?.navigationController.popViewController(animated: true)
            }
        }
        
        navigationController.pushViewController(articleDetailVC, animated: true)
    }
}

extension ArticleCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if fromViewController is ListArticleViewController {
            self.finish()
        }
    }
}

extension ArticleCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        
    }
}
