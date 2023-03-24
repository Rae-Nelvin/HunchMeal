//
//  Rules.swift
//  HunchMeal
//
//  Created by Leonardo Wijaya on 24/03/23.
//

import Foundation

struct Rules: Identifiable {
    let id = UUID()
    let rules: String
}

struct RulesList {
    static let lists: [Rules] = []
}
