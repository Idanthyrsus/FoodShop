//
//  TopView.swift
//  FoodShop
//
//  Created by Alexander Korchak on 28.06.2023.
//

import SwiftUI

struct TopView: View {
    
    var body: some View {
        HStack {
            Image("Location")
                .resizable()
                .frame(width: 24, height: 24, alignment: .leading)
                .padding(.bottom)
            VStack(alignment: .leading) {
                Text("Санкт-Петербург")
                    .font(Font.custom("SF-Pro-Display-Bold", size: 18))
                Text(Date.now.formatted(date: .long, time: .omitted))
                    .font(Font.custom("SF-Pro-Display-Bold", size: 14))
                    .foregroundColor(Color.theme.secondaryText)
            }
            Spacer()
            Image("Profile")
                .resizable()
                .frame(width: 44, height: 44, alignment: .topTrailing)
                .clipShape(Circle())
                .padding(.bottom, 4)
        }
        .padding([.leading, .trailing])
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
