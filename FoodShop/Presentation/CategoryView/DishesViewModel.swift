//
//  Category.swift
//  FoodShop
//
//  Created by Alexander Korchak on 28.06.2023.
//

import Foundation
import Combine

final class DishesViewModel: ObservableObject {
    
    @Published public var dishes: Dishes = Dishes(dishes: [])
    @Published var tags = Teg.allCases
    
    private var dishesService: DishServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(dishes: Dishes = Dishes(dishes: []),
         dishesService: NetworkServiceLocator = NetworkServiceLocatorImplementation()) {
        self.dishes = dishes
      self.dishesService = dishesService.dishService()
        getDishes()
    }
  
    func filterDishes(tag: Teg) -> [Dish] {
        self.dishes.dishes.filter { $0.tegs.contains(tag) }
    }
    
    private func getDishes() {
        dishesService.getDishes()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] dishes in
                guard let self = self else {
                    return
                }
                self.dishes = dishes
            }
            .store(in: &cancellables)
    }
}
