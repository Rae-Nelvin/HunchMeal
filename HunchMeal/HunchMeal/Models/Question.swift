//
//  Question.swift
//  HunchMeal
//
//  Created by Leonardo Wijaya on 22/03/23.
//

import Foundation

struct Question: Identifiable, Equatable {
    let id = UUID()
    let part1: String
    let part2: String
    
    func question() -> String {
        return part1 + " " + part2
    }
}
