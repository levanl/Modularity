//
//  BreedsViewController.swift
//  modular
//
//  Created by Levan Loladze on 23.11.23.
//

import UIKit

final class BreedsViewController: UIViewController {
    
    private let viewModel: BreedsViewModel
    private let itemView: BreedsView
    private var breeds: [BreedsModel.Breed] = []
    
    init() {
        self.itemView = BreedsView()
        viewModel = BreedsViewModel()
        super.init(nibName: nil, bundle: nil)
        self.breeds = []
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        setupOnLoad()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    private func setupOnLoad() {
        view = itemView
        view.backgroundColor = .white
    }
    
    private func setDelegates() {
        itemView.catBreedsTableView.delegate = self
        itemView.catBreedsTableView.dataSource = self
        viewModel.delegate = self
    }
    
}

extension BreedsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        breeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let breed = breeds[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: CatBreedTableViewCell.identifier) as? CatBreedTableViewCell {
            cell.configure(with: breed)
            return cell
        }
        return UITableViewCell()
    }
    
}

extension BreedsViewController: BreedsModelViewDelegate {
    func breedFetched(_ breeds: [BreedsModel.Breed]) {
        self.breeds = breeds
        DispatchQueue.main.sync {
            self.itemView.catBreedsTableView.reloadData()
        }
    }
    
    func showError(_ error: Error) {
        print("error")
    }
    
}

