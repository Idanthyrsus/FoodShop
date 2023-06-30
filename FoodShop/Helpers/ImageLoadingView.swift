//
//  ImageLoadingView.swift
//  FoodShop
//
//  Created by Alexander Korchak on 28.06.2023.
//

import Foundation
import SwiftUI

struct ImageLoadingView: View {
    
    let urlString: String
    let widthSize: CGFloat
    let heightSize: CGFloat
    
    var body: some View {
        
        AsyncImage(url: URL(string: urlString)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: widthSize)
            case .failure(_):
                Color.gray
                    .frame(width: widthSize)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: widthSize, height: heightSize)
    }
}

