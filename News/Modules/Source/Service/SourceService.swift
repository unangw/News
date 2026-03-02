//
//  SourceService.swift
//  News
//
//  Created by BTS.id on 02/03/26.
//

protocol SourceServiceProtocol {
    func getSource(request: SourceRequestModel) async throws -> Result<SourceResponseModel, ResponseError>
}

class SourceService: SourceServiceProtocol, HTTPClient {
    func getSource(request: SourceRequestModel) async throws -> Result<SourceResponseModel, ResponseError> {
        return try await sendRequest(endpoint: SourceEndpoint.getSource(request: request), responseModel: SourceResponseModel.self)
    }
}
