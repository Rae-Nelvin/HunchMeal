//
//  FoodProcesses.swift
//  HunchMeal
//
//  Created by Leonardo Wijaya on 22/03/23.
//

import Foundation

struct FoodProcesses: Identifiable {
    let id = UUID()
    let process: String
}

struct FoodProcessesList {
    static let lists: [FoodProcesses] = [
        FoodProcesses(process: "Fried"), // 0
        FoodProcesses(process: "Boiled"),
        FoodProcesses(process: "Baked"),
        FoodProcesses(process: "Pasteurized"),
        FoodProcesses(process: "Steamed"),
        FoodProcesses(process: "Pan Fried"), // 5
    ]
}
