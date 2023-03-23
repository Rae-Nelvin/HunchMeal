//
//  FoodTaste.swift
//  HunchMeal
//
//  Created by Leonardo Wijaya on 22/03/23.
//

import Foundation

struct FoodTaste: Identifiable {
    let id = UUID()
    let taste: String
}

struct FoodTasteLists {
    static let lists: [FoodTaste] = [FoodTaste(taste: "Sweet"), // 0
                                     FoodTaste(taste: "Sour"),
                                     FoodTaste(taste: "Salty"),
                                     FoodTaste(taste: "Bitter"),
                                     FoodTaste(taste: "Umami"),
                                     FoodTaste(taste: "Spicy"), //5
    ]
}
