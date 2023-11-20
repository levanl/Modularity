//
//  HomeModel.swift
//  modular
//
//  Created by Levan Loladze on 19.11.23.
//

import UIKit

// MARK: - Model
struct FactModel: Decodable {
    
    let data: [Fact]
    
    struct Fact: Decodable {
        let fact: String
        let length: Int
    }
    
}

