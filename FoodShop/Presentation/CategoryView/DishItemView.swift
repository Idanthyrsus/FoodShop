//
//  DishItemView.swift
//  FoodShop
//
//  Created by Alexander Korchak on 30.06.2023.
//

import SwiftUI

struct DishItemView: View {

    let dish: Dish
    var backroundColor = Color.theme.itemBackground
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 109, height: 109)
                    .foregroundColor(backroundColor)
                
                ImageLoadingView(urlString: dish.imageURL ?? "", widthSize: 80, heightSize: 80)
            }
            VStack {
                Text(dish.name ?? "")
                    .lineLimit(2)
                    .font(.system(size: 14))
                Spacer()
            }
        }
    }
}

struct DishItemView_Previews: PreviewProvider {
    static var previews: some View {
        DishItemView(dish: Dish.mockData)
            
    }
}
