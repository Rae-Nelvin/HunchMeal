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
    static let lists: [FoodProcesses] = []
}
