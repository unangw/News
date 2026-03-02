//
//  RequestState.swift
//  News
//
//  Created by BTS.id on 02/03/26.
//

enum RequestState {
    case loading
    case loaded
    case error(_: ResponseError)
}
