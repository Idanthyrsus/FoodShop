//
//  CategoryService.swift
//  FoodShop
//
//  Created by Alexander Korchak on 28.06.2023.
//
import Combine

protocol CategoryServiceProtocol {
    var networkService: NetworkServiceProtocol { get }
    
    func getCategories() -> AnyPublisher<Categories, Error>
}

final class CategoryService: CategoryServiceProtocol {
    
    var networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceLocator = NetworkServiceLocatorImplementation()) {
      self.networkService = networkService.networkService()
    }
    
    func getCategories() -> AnyPublisher<Categories, Error> {
        let endpoint = Endpoint.categories
        return networkService.get(type: Categories.self, url: endpoint.url)
    }
}
