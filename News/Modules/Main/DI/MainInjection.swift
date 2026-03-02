//
//  MainInjection.swift
//  News
//
//  Created by BTS.id on 02/03/26.
//

import Foundation

class MainInjection: NSObject {
    static func provideService() -> MainServiceProtocol {
        return MainService()
    }
    
    static func provideMainViewModel() -> MainViewModelProtocol {
        return MainViewModel(service: provideService())
    }
}
