//
//  Rules.swift
//  HunchMeal
//
//  Created by Leonardo Wijaya on 24/03/23.
//

import Foundation

struct Rules: Identifiable, Hashable {
    let id = UUID()
    let rules: String
}

struct RulesList {
    static let lists: [Rules] = [
        Rules(rules: "There are 20 cards of foods where 1 of them are the correct food our game intended for you to choose"),
        Rules(rules: "Eliminate other 19 and if you get the last card correct, congrats you have won the game!"),
        Rules(rules: "Single tap on a card to eliminate the food which is not the correct food. But BEWARE! Once you eliminate the card, you can't have it back"),
        Rules(rules: "You can long press each of the cards to view the name of the food and see the image more clearly"),
        Rules(rules: "You may tap \("Ask Question") button to help you find the food you can ask questions to our bot and it will answer if the food compatible with what question you asked"),
        Rules(rules: "However, there're 4 questions, which with minimum of 2 is compatible with the correct food."),
        Rules(rules: "Last rules, have fun and keep that smile of yours :)")
    ]
}
