//
//  Color+Extensions.swift
//  FoodShop
//
//  Created by Alexander Korchak on 28.06.2023.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let secondaryText = Color("dateLabel")
    let itemBackground = Color("itemBackground")
    let buttonBackground = Color("buttonBackground")
}
