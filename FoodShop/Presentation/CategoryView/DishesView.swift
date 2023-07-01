//
//  CategoryView.swift
//  FoodShop
//
//  Created by Alexander Korchak on 28.06.2023.
//

import SwiftUI

struct DishesView: View {
    
    @StateObject private var viewModel: DishesViewModel = .init()
    @ObservedObject private var cartViewModel: CartViewModel
    
    @State var backroundColor = Color.theme.itemBackground
    @State private var selection: Teg? = nil
    @State private var isSelected: Bool = false
    @State private var showingSheet: Bool = false
    @State var dish: Dish? = nil
    @State var filteredArray: [Dish] = []
    
    let navigationTitle: String
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    init(navigationTitle: String, cartViewModel: CartViewModel) {
        self.navigationTitle = navigationTitle
        self.cartViewModel = cartViewModel
        
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .systemBackground
        appearance.backgroundColor = .systemBackground
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(viewModel.tags, id: \.self) { element in
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill((selection == element) ? Color.theme.buttonBackground : backroundColor)
                            .frame(width: 94, height: 35)
                        
                        Button {
                            self.selection = element
                            filteredArray = viewModel.filterDishes(tag: element)
                            isSelected = true
                        } label: {
                            Text(element.rawValue)
                                .foregroundColor((selection == element) ? .white : .black)
                                .font(.system(size: 14))
                        }
                    }
                    .padding(.bottom)
                    .padding(.top)
                }
            }
        }
        .padding(.horizontal)
        
        ZStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 6) {
                    ForEach(isSelected ? filteredArray : viewModel.dishes.dishes) { dish in
                        DishItemView(dish: dish)
                            .onTapGesture {
                                self.dish = dish
                                showingSheet.toggle()
                            }
                    }
                }
                .padding(.horizontal)
            }
            
            .toolbar(content: {
                ToolbarItem {
                    Image("Profile")
                        .resizable()
                        .frame(width: 44, height: 44, alignment: .topTrailing)
                        .clipShape(Circle())
                        .padding(.leading)
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    CustomBackButton()
                }
            })
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(navigationTitle)
            
            OrderCardView(cartViewModel: cartViewModel,
                          isPresented: $showingSheet,
                          dish: dish)
                .offset(y: showingSheet ? 0 : 1000)
                .animation(.easeInOut(duration: 0.5), value: showingSheet)
        }
    }
}

struct DishesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DishesView(navigationTitle: "Dishes", cartViewModel: CartViewModel())
                .environmentObject(CartViewModel())
        }
    }
}
