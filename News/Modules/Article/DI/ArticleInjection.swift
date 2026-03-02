//
//  ArticleInjection.swift
//  News
//
//  Created by BTS.id on 02/03/26.
//

import Foundation

class ArticleInjection: NSObject {
    static func provideService() -> ArticleServiceProtocol {
        return ArticleService()
    }
    
    static func provideArticleViewModel() -> ArticleViewModelProtocol {
        return ArticleViewModel(service: provideService())
    }
}
