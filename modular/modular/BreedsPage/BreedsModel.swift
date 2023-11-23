//
//  BreedsModel.swift
//  modular
//
//  Created by Levan Loladze on 23.11.23.
//

import Foundation



struct BreedsModel: Decodable {
    
    let data: [Breed]
    
    struct Breed: Decodable {
        let breed: String
        let country: String
    }
    
}
