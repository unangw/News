//
//  ArticleResponseModel.swift
//  News
//
//  Created by BTS.id on 02/03/26.
//

struct ArticleResponseModel: Equatable, Codable {
    let status: String?
    let totalResults: Int?
    let articles: [ArticleItemModel]?
}
