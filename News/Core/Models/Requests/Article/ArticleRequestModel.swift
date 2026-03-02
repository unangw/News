//
//  NewsRequestModel.swift
//  News
//
//  Created by BTS.id on 02/03/26.
//

struct ArticleRequestModel: Equatable, Codable {
    let q: String?
    var sources: [String]?
    let pageSize: Int?
    let page: Int?
}
