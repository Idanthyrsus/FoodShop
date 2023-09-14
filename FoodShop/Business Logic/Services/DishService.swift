//
//  DishService.swift
//  FoodShop
//
//  Created by Alexander Korchak on 28.06.2023.
//
import Combine

protocol DishServiceProtocol {
    var networkService: NetworkServiceProtocol { get }
    func getDishes() -> AnyPublisher<Dishes, Error>
}

final class DishService: DishServiceProtocol {
    
    var networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceLocator = NetworkServiceLocatorImplementation()) {
      self.networkService = networkService.networkService()
    }
    
    func getDishes() -> AnyPublisher<Dishes, Error> {
        let endpoint = Endpoint.dishes
        
        return networkService.get(type: Dishes.self, url: endpoint.url)
    }
}
