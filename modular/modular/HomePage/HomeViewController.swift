//
//  HomeView.swift
//  modular
//
//  Created by Levan Loladze on 19.11.23.
//

import UIKit

// MARK: - ViewController
final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    private let viewModel: HomeViewModel
    private let itemView: HomeView
    private var facts: [FactModel.Fact] = []
    
    init() {
        self.itemView = HomeView()
        viewModel = HomeViewModel()
        super.init(nibName: nil, bundle: nil)
        self.facts = []
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
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
        itemView.catFactsTableView.delegate = self
        itemView.catFactsTableView.dataSource = self
        viewModel.delegate = self
    }
    
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        facts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fact = facts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: CatFactsTableViewCell.identifier) as? CatFactsTableViewCell {
            cell.configure(with: fact)
            return cell
        }
        return UITableViewCell()
    }
    
    
}

// MARK: ViewModel Delegate
extension HomeViewController: HomeViewModelDelegate {
    func factFetched(_ facts: [FactModel.Fact]) {
        self.facts = facts
        DispatchQueue.main.sync {
            self.itemView.catFactsTableView.reloadData()
        }
    }
    
    func showError(_ error: Error) {
        print("error")
    }
    
}
