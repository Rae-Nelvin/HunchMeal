//
//  Food.swift
//  HunchMeal
//
//  Created by Leonardo Wijaya on 22/03/23.
//

import Foundation

struct Food: Identifiable {
    let id = UUID()
    let name: String
    let type: FoodType
    let origin: FoodOrigin
    let cookProcesses: FoodProcesses
    let taste: [FoodTaste]
    let ingredient: [FoodIngredient]
    var isElim: Bool = false
}

struct FoodLists {
    static let lists: [Food] = []
}
