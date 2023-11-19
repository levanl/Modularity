//
//  HomeView.swift
//  modular
//
//  Created by Levan Loladze on 19.11.23.
//

import UIKit

// MARK: View
final class HomeView: UIView {
    
    // MARK: Properties
    private let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Cat Facts"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let catFactsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return tableView
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Private Functions
    private func setupUI() {
        setupLabel()
        setupTableView()
    }
    
    private func setupLabel() {
        addSubview(helloLabel)
        
        NSLayoutConstraint.activate([
            helloLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            helloLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupTableView() {
        addSubview(catFactsTableView)
        
        catFactsTableView.register(CatFactsTableViewCell.self, forCellReuseIdentifier: CatFactsTableViewCell.identifier)
        
        NSLayoutConstraint.activate([
            catFactsTableView.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 40),
            catFactsTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            catFactsTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            catFactsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
    
}
