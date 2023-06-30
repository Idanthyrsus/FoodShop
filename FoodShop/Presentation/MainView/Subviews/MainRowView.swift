//
//  MainRowView.swift
//  FoodShop
//
//  Created by Alexander Korchak on 28.06.2023.
//

import SwiftUI

struct MainRowView: View {
    
    let category: DishСategory
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            ImageLoadingView(urlString: category.imageURL ?? "", widthSize: 343, heightSize: 148)
                .cornerRadius(10)
                .padding(.bottom, 6)
            VStack {
                Text(category.name ?? "")
                    .font(.system(size: 20, weight: .medium))
                    .padding(.top)
                    .padding(.leading)
                Spacer()
            }
        }
    }
}
