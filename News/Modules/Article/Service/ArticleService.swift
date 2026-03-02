//
//  ArticleService.swift
//  News
//
//  Created by BTS.id on 02/03/26.
//

protocol ArticleServiceProtocol {
    func getArticles(request: ArticleRequestModel) async throws -> Result<ArticleResponseModel, ResponseError>
}

class ArticleService: ArticleServiceProtocol, HTTPClient {
    func getArticles(request: ArticleRequestModel) async throws -> Result<ArticleResponseModel, ResponseError> {
        return try await sendRequest(endpoint: ArticleEndpoint.getArticles(request: request), responseModel: ArticleResponseModel.self)
    }
}
