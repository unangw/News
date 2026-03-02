//
//  ArticleDetailViewController.swift
//  News
//
//  Created by BTS.id on 02/03/26.
//

import UIKit
import WebKit

class ArticleDetailViewController: BaseViewController {
    // MARK: - Outlets
    @IBOutlet weak var articleWebView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Variables
    var didSendEventClosure: ((ArticleDetailViewController.Event) -> Void)?
    var article: ArticleItemModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Setup UI
        setupUI()
    }
    
    private func setupUI() {
        // MARK: - Setup Navigation
        setupNavigation()
        
        // MARK: - Setup WebView
        setupWebView()
    }
    
    private func setupWebView() {
        articleWebView.navigationDelegate = self
        
        guard let urlString = article.url, let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        articleWebView.load(request)
    }
    
    private func setupNavigation() {
        let backGesture = UITapGestureRecognizer(target: self, action: #selector(closeNewsDetailsScreen))
        setupNavigationBar(title: "Article Detail", backAction: backGesture)
    }
    
    @objc private func closeNewsDetailsScreen() {
        didSendEventClosure?(.articleDetail)
    }
}

extension ArticleDetailViewController {
    enum Event {
        case articleDetail
    }
}

extension ArticleDetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
    }
}
