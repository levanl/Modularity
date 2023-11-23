//
//  BreedsView.swift
//  modular
//
//  Created by Levan Loladze on 23.11.23.
//

import UIKit

class BreedsView: UIView {
    
    private let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Cat Breeds"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let catBreedsTableView: UITableView = {
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
        addSubview(catBreedsTableView)
        
        catBreedsTableView.register(CatBreedTableViewCell.self, forCellReuseIdentifier: CatBreedTableViewCell.identifier)
        
        NSLayoutConstraint.activate([
            catBreedsTableView.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 40),
            catBreedsTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            catBreedsTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            catBreedsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
}
