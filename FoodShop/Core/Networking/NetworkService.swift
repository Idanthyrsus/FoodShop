//
//  NetworkService.swift
//  FoodShop
//
//  Created by Alexander Korchak on 28.06.2023.
//

import Foundation
import Combine

protocol NetworkServiceProtocol: AnyObject {
    
    func get<T>(type: T.Type, url: URL) -> AnyPublisher<T, Error> where T: Decodable
}

final class NetworkService: NetworkServiceProtocol {
    
    func get<T>(type: T.Type, url: URL) -> AnyPublisher<T, Error> where T: Decodable {
      
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: type, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
