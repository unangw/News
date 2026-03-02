//
//  SourceInjection.swift
//  News
//
//  Created by BTS.id on 02/03/26.
//

import Foundation

class SourceInjection: NSObject {
    static func provideService() -> SourceServiceProtocol {
        return SourceService()
    }
    
    static func provideSourceViewModel() -> SourceViewModelProtocol {
        return SourceViewModel(service: provideService())
    }
}
