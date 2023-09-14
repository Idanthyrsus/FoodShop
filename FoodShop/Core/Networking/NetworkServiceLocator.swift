//
//  NetworkServiceLocator.swift
//  FoodShop
//
//  Created by Alexander Korchak on 08.09.2023.
//

import Foundation

protocol NetworkServiceLocator {
  func networkService() -> NetworkServiceProtocol
  func dishService() -> DishServiceProtocol
  func categoryService() -> CategoryServiceProtocol
}

extension NetworkServiceLocator {
  func networkService() -> NetworkServiceProtocol {
    return NetworkService()
  }
  
  func dishService() -> DishServiceProtocol {
    return DishService()
  }
  
  func categoryService() -> CategoryServiceProtocol {
    return CategoryService()
  }
}

final class NetworkServiceLocatorImplementation: NetworkServiceLocator { }
