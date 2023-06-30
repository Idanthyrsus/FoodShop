//
//  ProductRow.swift
//  FoodShop
//
//  Created by Alexander Korchak on 29.06.2023.
//

import SwiftUI

struct ProductRow: View {
    
    @ObservedObject var cartViewModel: CartViewModel
    var dish: Dish
    @State var count: Int = 1
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 62, height: 62)
                .foregroundColor(Color.theme.itemBackground)
                .overlay(alignment: .center) {
                    ImageLoadingView(urlString: dish.imageURL ?? "", widthSize: 45.5, heightSize: 47.21)
                }
            namePriceWeight
            Spacer()
            addRemoveCounter
        }
    }
}

extension ProductRow {
    
    var namePriceWeight: some View {
        VStack(alignment: .leading) {
            Text(dish.name ?? "")
                .font(.system(size: 14))
            HStack {
                Text("\(dish.price ?? 0) ₽")
                Text("• \(dish.weight ?? 0)г")
                    .foregroundColor(Color.theme.secondaryText)
            }
            .padding(.bottom, 3)
            .font(.system(size: 14))
        }
    }
}

extension ProductRow {
    var addRemoveCounter: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.theme.itemBackground)
                .frame(width: 99, height: 32)
            HStack {
                
                Button {
                    if count == 1 {
                        cartViewModel.removeFromCart(product: dish)
                    } else if count > 1 {
                        count -= 1
                        cartViewModel.decreasePrice(product: dish)
                    }
                } label: {
                    Image("minus")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
               
                .padding(.leading, 30)
               
                Text("\(count)")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .frame(width: 26, height: 10, alignment: .center)
                   
                Button {
                    count += 1
                    cartViewModel.increasePrice(product: dish)
                } label: {
                    Image("plus")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .padding(.trailing, 30)
            }
        }
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(cartViewModel: CartViewModel(), dish: Dish.mockData, count: 1)
    }
}
