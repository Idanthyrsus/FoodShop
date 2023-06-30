//
//  OrderCardView.swift
//  FoodShop
//
//  Created by Alexander Korchak on 29.06.2023.
//

import SwiftUI

struct OrderCardView: View {
    
    @ObservedObject var cartViewModel: CartViewModel
    @Binding var isPresented: Bool
    let dish: Dish?
    
    var body: some View {
        ZStack {
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 311, height: 232)
                    .foregroundColor(Color.theme.itemBackground)
                
                dishDescription
                addToCartButton
            }
            
            ImageLoadingView(urlString: dish?.imageURL ?? "",
                             widthSize: 198,
                             heightSize: 204)
            .offset(x: 0, y: -88)
            
            likeAndDismissButtons
                .offset(x: 100, y: -180)
        }
        .frame(width: 343, height: 446)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
    }
}

extension OrderCardView {
    
    var dishDescription: some View {
        
        VStack(alignment: .leading) {
            Text(dish?.name ?? "")
                .font(.system(size: 16))
                .padding(.bottom, 2)
            HStack {
                Text("\(dish?.price ?? 0) ₽")
                Text("\(dish?.weight ?? 0)г")
                    .foregroundColor(Color.theme.secondaryText)
            }
            .padding(.bottom, 2)
            .font(.system(size: 14))
            
            Text(dish?.description ?? "")
                .lineLimit(4)
                .font(.system(size: 14))
                .foregroundColor(Color.theme.secondaryText)
                .padding(.bottom, 18)
        }
        .padding([.leading, .trailing])
    }
}

extension OrderCardView {
    
    var addToCartButton: some View {
        Button {
            cartViewModel.addToCart(product: dish ?? Dish.mockData)
        } label: {
            Text("Добавить в корзину")
                .font(.system(size: 16))
                .fontWeight(.semibold)
        }
        .foregroundColor(Color.white)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.theme.buttonBackground)
                .frame(width: 311, height: 48)
        )
        .padding(.bottom)
    }
}

extension OrderCardView {
    var likeAndDismissButtons: some View {
        HStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 40, height: 40)
                .foregroundColor(Color.white)
                .overlay(alignment: .center) {
                    
                    Button {
                        
                    } label: {
                        Image("heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                }
            
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 40, height: 40)
                .foregroundColor(Color.white)
                .overlay(alignment: .center) {
                    
                    Button {
                        isPresented = false
                    } label: {
                        Image("xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                }
        }
    }
}

struct OrderCardView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCardView(cartViewModel: CartViewModel(), isPresented: .constant(true), dish: Dish.mockData)
        
    }
}
