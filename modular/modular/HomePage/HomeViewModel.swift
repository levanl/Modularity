//
//  HomeViewModel.swift
//  modular
//
//  Created by Levan Loladze on 19.11.23.
//

import UIKit

protocol HomeViewModelDelegate: AnyObject {
    func factFetched(_ facts: [FactModel.Fact])
    func showError(_ error: Error)
}

final class HomeViewModel {
    
    private var facts: [FactModel.Fact]?
    
    weak var delegate: HomeViewModelDelegate?
    
    func viewDidLoad() {
        fetchFacts()
    }
    
    func fetchFacts() {
        NetworkManager.getFacts { result in
            switch result {
            case .success(let factModel):
                self.facts = factModel.data
                self.delegate?.factFetched(factModel.data)
            case .failure(let error):
                self.delegate?.showError(error)
            }
        }
    }
}
