//
//  SourceResponseModel.swift
//  News
//
//  Created by BTS.id on 02/03/26.
//

struct SourceResponseModel: Equatable, Codable {
    let status: String?
    let sources: [SourceItemModel]?
}
