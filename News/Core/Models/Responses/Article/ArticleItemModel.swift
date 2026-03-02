//
//  NewsItemModel.swift
//  News
//
//  Created by BTS.id on 02/03/26.
//

struct ArticleItemModel: Equatable, Codable {
    let source: SourceItemModel?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}
