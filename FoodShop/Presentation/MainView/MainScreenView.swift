//
//  ContentView.swift
//  FoodShop
//
//  Created by Alexander Korchak on 28.06.2023.
//

import SwiftUI

struct MainScreenView: View {
    
    @StateObject private var viewModel: MainScreenViewModel = .init()
    @ObservedObject var cartViewModel: CartViewModel
    
    var body: some View {
        
        NavigationStack {
            TopView()
            ScrollView {
                ForEach(viewModel.categories.сategories) { category in
                    NavigationLink {
                        DishesView(navigationTitle: category.name ?? "", cartViewModel: cartViewModel)
                    } label: {
                        MainRowView(category: category)
                        .transition(.opacity.animation(.easeInOut))
                    }
                    .tint(.black)
                }
            }
            .scrollIndicators(.hidden)
            .onAppear {
                viewModel.onAppear()
            }
        }
    }
}

