//
//  HomeViewModel.swift
//  modular
//
//  Created by Levan Loladze on 19.11.23.
//

import UIKit
import NetworkingPackageGeneric

protocol HomeViewModelDelegate: AnyObject {
    func factFetched(_ facts: [FactModel.Fact])
    func showError(_ error: Error)
}

// MARK: ViewModel
final class HomeViewModel {
    
    private var facts: [FactModel.Fact]?
    
    weak var delegate: HomeViewModelDelegate?
    
    func viewDidLoad() {
        fetchFacts()
    }
    
    private func fetchFacts() {
        let apiURL = "https://catfact.ninja/facts"
        NetworkManager.fetchData(from: apiURL, modelType: FactModel.self) { result in
            switch result {
            case .success(let factModel):
                self.facts = factModel.data
                self.delegate?.factFetched(factModel.data)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
