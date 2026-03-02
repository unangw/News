//
//  MainViewModel.swift
//  News
//
//  Created by BTS.id on 02/03/26.
//

import Foundation

protocol MainViewModelProtocol {
    // MARK: - States
    
    // MARK: - Variables
    
    // MARK: - Functions
}

class MainViewModel: MainViewModelProtocol {
    let service: MainServiceProtocol
    
    init(service: MainServiceProtocol) {
        self.service = service
    }
}
