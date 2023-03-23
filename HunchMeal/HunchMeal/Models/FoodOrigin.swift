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
    static let lists: [FoodOrigin] = [
        FoodOrigin(origin: "Indonesia"), // 0
        FoodOrigin(origin: "Betawi"),
        FoodOrigin(origin: "Papua"),
        FoodOrigin(origin: "Makassar"),
        FoodOrigin(origin: "Solo"),
        FoodOrigin(origin: "Gunung Kidul"), // 5
        FoodOrigin(origin: "Banyuwangi"),
        FoodOrigin(origin: "Tiongkok"),
        FoodOrigin(origin: "Semarang"),
        FoodOrigin(origin: "Bandung"),
        FoodOrigin(origin: "Cirebon"), // 10
        FoodOrigin(origin: "Bali"),
        FoodOrigin(origin: "Jawa"),
        FoodOrigin(origin: "Sunda")
    ]
}
