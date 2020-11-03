//
//  NetworkService.swift
//  iChol
//
//  Created by Wendy Kurniawan on 03/11/20.
//

import Foundation
import FatSecretSwift

enum ServiceError: Error {
    case noResult
}

class NetworkService {
    
    private let client = FatSecretClient()
    static let shared = NetworkService()
    
    func searchFood(keyword: String, completion: @escaping (Result<[SearchedFood], Error>) -> Void) {
        client.searchFood(name: keyword) { (result) in
            if result.foods.isEmpty {
                completion(.failure(ServiceError.noResult))
            } else {
                completion(.success(result.foods))
            }
        }
    }
    
    func get(id: String) {
        client.getFood(id: id) { food in
            print(food)
        }
    }
    
}
