//
//  FoodOrigin.swift
//  HunchMeal
//
//  Created by Leonardo Wijaya on 22/03/23.
//

import Foundation

struct FoodOrigin: Identifiable {
    let id = UUID()
    let origin: String
}

struct FoodOriginLists {
    static let lists: [FoodOrigin] = [FoodOrigin(origin: "Indonesia")]
}
