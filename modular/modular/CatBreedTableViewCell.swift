//
//  CatBreedTableViewCell.swift
//  modular
//
//  Created by Levan Loladze on 23.11.23.
//

import UIKit

class CatBreedTableViewCell: UITableViewCell {

    static let identifier = "CatBreedsTableViewCell"
    
    private let fact: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupFact()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupFact() {
        addSubview(fact)
        
        NSLayoutConstraint.activate([
            fact.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            fact.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            fact.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            fact.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with model: BreedsModel.Breed) {
        fact.text = model.breed
    }
}
