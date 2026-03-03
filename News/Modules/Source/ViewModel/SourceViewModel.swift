//
//  SourceViewModel.swift
//  News
//
//  Created by BTS.id on 02/03/26.
//

import RxSwift
import RxRelay
import Foundation

protocol SourceViewModelProtocol {
    // MARK: - States
    var getSourceState: Observable<RequestState> { get }
    
    // MARK: - Variables
    var sources: [SourceItemModel] { get set }
    
    // MARK: - Functions
    func getSource(request: SourceRequestModel)
    func staticSearch(query: String?)
}

class SourceViewModel: SourceViewModelProtocol {
    let service: SourceServiceProtocol
    
    private let sourceStateRelay = PublishRelay<RequestState>()
    
    var getSourceState: Observable<RequestState> {
        return sourceStateRelay.asObservable()
    }
    
    var sources: [SourceItemModel] = []
    var remoteSources: [SourceItemModel] = []
    
    init(service: SourceServiceProtocol) {
        self.service = service
    }
    
    func getSource(request: SourceRequestModel) {
        sourceStateRelay.accept(.loading)
        
        Task {
            let result = try await self.service.getSource(request: request)
            
            switch result {
            case .success(let response):
                sources = response.sources ?? []
                remoteSources = response.sources ?? []
                
                self.sourceStateRelay.accept(.loaded)
            case .failure(let failure):
                self.sourceStateRelay.accept(.error(failure))
            }
        }
    }
    
    func staticSearch(query: String?) {
        sourceStateRelay.accept(.loading)
        
        if query == nil || query!.isEmpty {
            self.sources = remoteSources
        } else {
            let filteredResults = remoteSources.filter { item in
                let nameMatch = item.name?.lowercased().contains(query!.lowercased()) ?? false
                let descriptionMatch = item.description?.lowercased().contains(query!.lowercased()) ?? false
                
                return nameMatch || descriptionMatch
            }
            self.sources = filteredResults
        }
        
        self.sourceStateRelay.accept(.loaded)
    }
}
