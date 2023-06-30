//
//  Category.swift
//  FoodShop
//
//  Created by Alexander Korchak on 28.06.2023.
//

import Foundation

struct Categories: Codable {
    let сategories: [DishСategory]
}

// MARK: - Сategory
struct DishСategory: Codable, Identifiable {
    let id: Int?
    let name: String?
    let imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageURL = "image_url"
    }
}
