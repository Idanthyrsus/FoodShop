//
//  FoodShopApp.swift
//  FoodShop
//
//  Created by Alexander Korchak on 28.06.2023.
//

import SwiftUI

@main
struct FoodShopApp: App {
    
    @StateObject private var cartViewModel: CartViewModel = .init()
    
    var body: some Scene {
        
        WindowGroup {
            TabBarView(cartViewModel: cartViewModel)
        }
    }
}
