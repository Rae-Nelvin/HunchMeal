//
//  FoodIngredient.swift
//  HunchMeal
//
//  Created by Leonardo Wijaya on 22/03/23.
//

import Foundation

struct FoodIngredient: Identifiable {
    let id = UUID()
    let ingredient: String
}

struct FoodIngredientLists {
    static let lists: [FoodIngredient] = []
}
