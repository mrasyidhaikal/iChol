//
//  NetworkService.swift
//  iChol
//
//  Created by Wendy Kurniawan on 03/11/20.
//

import Foundation
import FatSecretSwift

class NetworkService {
    
    private let client = FatSecretClient()
    static let shared = NetworkService()
    
    func search(name: String = "Nasi Goreng") {
        client.searchFood(name: name) { search in
            print(search)
        }
    }
    
    func get(id: String) {
        client.getFood(id: id) { food in
            print(food)
        }
    }
    
}
