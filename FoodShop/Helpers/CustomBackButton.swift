//
//  CustomBackButton.swift
//  FoodShop
//
//  Created by Alexander Korchak on 28.06.2023.
//

import SwiftUI

struct CustomBackButton: View {
    
   
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
            self._dismiss.wrappedValue.callAsFunction()
        }) {
            HStack(spacing: 0) {
                Image("vector-3")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 6, height: 12)
                    .foregroundColor(Color.theme.backButtonColor)
                    
            }
            .padding(.leading)
        }
    }
}

struct CustomBackButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackButton()
    }
}
