//
//  BreedsViewModel.swift
//  modular
//
//  Created by Levan Loladze on 23.11.23.
//

import Foundation
import NetworkingPackageGeneric

protocol BreedsModelViewDelegate: AnyObject {
    func breedFetched(_ breeds: [BreedsModel.Breed])
    func showError(_ error: Error)
}

final class BreedsViewModel {
    private var breeds: [BreedsModel.Breed]?
    
    weak var delegate: BreedsModelViewDelegate?

    func viewDidLoad() {
        fetchBreeds()
    }
    
    private func fetchBreeds() {
        let apiURL = "https://catfact.ninja/breeds"
        NetworkManager.fetchData(from: apiURL, modelType: BreedsModel.self) { result in
            switch result {
            case .success(let breedModel):
                self.breeds = breedModel.data
                self.delegate?.breedFetched(breedModel.data)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }

}
