//
//  MainScreenViewModel.swift
//  FoodShop
//
//  Created by Alexander Korchak on 28.06.2023.
//

import Foundation
import Combine

final class MainScreenViewModel: ObservableObject {
  
  @Published public var categories: Categories = Categories(сategories: [])
  
  private var categoriesService: CategoryServiceProtocol
  private var cancellables = Set<AnyCancellable>()
  
  init(categories: Categories = Categories(сategories: []),
       categoriesService: NetworkServiceLocator = NetworkServiceLocatorImplementation()) {
    self.categories = categories
    self.categoriesService = categoriesService.categoryService()
  }
  
  public func onAppear() {
    getCategories()
  }
  
  private func getCategories() {
    categoriesService.getCategories()
      .receive(on: DispatchQueue.main)
      .sink { completion in
        switch completion {
        case .failure(let error):
          print(error.localizedDescription)
        case .finished:
          break
        }
      } receiveValue: { [weak self] categories in
        guard let self = self else {
          return
        }
        self.categories = categories
      }
      .store(in: &cancellables)
  }
}
 
