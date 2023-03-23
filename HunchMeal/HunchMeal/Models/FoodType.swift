//
//  FoodType.swift
//  HunchMeal
//
//  Created by Leonardo Wijaya on 22/03/23.
//

import Foundation

struct FoodType: Identifiable {
    let id = UUID()
    let type: String
}

struct FoodTypeLists {
    static let lists: [FoodType] = [FoodType(type: "Main Course"),
                                    FoodType(type: "Side Dish"),
                                    FoodType(type: "Dessert"),
                                    FoodType(type: "Appetizer"),
                                    FoodType(type: "Snack")]
}
