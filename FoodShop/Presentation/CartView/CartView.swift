//
//  CartView.swift
//  FoodShop
//
//  Created by Alexander Korchak on 28.06.2023.
//

import SwiftUI

struct CartView: View {
    
    @ObservedObject var cartViewModel: CartViewModel
   
    @State var count: Int = 0
    
    var body: some View {
        NavigationStack {
            TopView()
                .padding(.bottom)
            
            ScrollView(showsIndicators: false) {
                
                if cartViewModel.products.count > 0 {
                    ForEach(cartViewModel.products, id: \.self) { dish in
                        ProductRow(cartViewModel: cartViewModel, dish: dish)
                        .padding(.leading)
                        .padding(.bottom, 10)
                    }
                } else {
                    VStack {
                        Spacer()
                        Text("Ваша корзина пуста")
                            .font(.system(size: 16))
                            .padding(.top, 20)
                    }
                    .frame(width: 200, height: 300, alignment: .center)
                }
            }
            Button {
             
            } label: {
                Text("Оплатить " + String(cartViewModel.total) + " ₽")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
            }
            .foregroundColor(Color.white)
            .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.theme.buttonBackground)
                .frame(width: 343, height: 48)
            )
            .padding(.bottom, 30)
        }
    }
}

