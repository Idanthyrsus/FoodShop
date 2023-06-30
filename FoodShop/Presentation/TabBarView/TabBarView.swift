//
//  TabBarView.swift
//  FoodShop
//
//  Created by Alexander Korchak on 28.06.2023.
//

import SwiftUI

struct TabBarView: View {
    
    @ObservedObject var cartViewModel: CartViewModel
    
    var body: some View {
        TabView {
            MainScreenView(cartViewModel: cartViewModel)
                .tabItem {
                    VStack {
                        Image("main")
                            .renderingMode(.template)
                        Text("Главная")
                    }
                }
            SearchView()
                .tabItem {
                    VStack {
                        Image("search")
                            .renderingMode(.template)
                        Text("Поиск")
                    }
                }
            
            CartView(cartViewModel: cartViewModel)
                .environmentObject(cartViewModel)
                .tabItem {
                    VStack {
                        Image("cart")
                            .renderingMode(.template)
                        Text("Корзина")
                    }
                }
            
            AccountView()
                .tabItem {
                    VStack {
                        Image("account")
                            .renderingMode(.template)
                        Text("Аккаунт")
                    }
                }
        }
        .font(.system(size: 10, weight: .medium))
        .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(cartViewModel: CartViewModel())
    }
}
