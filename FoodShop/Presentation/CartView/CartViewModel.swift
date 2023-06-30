//
//  CartViewModel.swift
//  FoodShop
//
//  Created by Alexander Korchak on 29.06.2023.
//

import Foundation

final class CartViewModel: ObservableObject {
    @Published private(set) var products: [Dish] = []
    @Published var total: Int = 0
    
    func addToCart(product: Dish) {
        guard !products.contains(where: { $0.id == product.id }) else {
            return
        }
        products.append(product)
        total += product.price ?? 0
    }
    
    func removeFromCart(product: Dish) {
        products = products.filter({ $0.id != product.id })
        total -= product.price ?? 0
    }
    
    func increasePrice(product: Dish) {
        total += product.price ?? 0
    }
    
    func decreasePrice(product: Dish) {
        total -= product.price ?? 0
    }
}
