//
//  EndGameViewModel.swift
//  HunchMeal
//
//  Created by Leonardo Wijaya on 22/03/23.
//

import Foundation

class EndGameViewModel: ObservableObject {
    @Published var score: Int
    
    init(guessCount: Int) {
        if (guessCount == 0) {
            score = 100
        } else if (guessCount > 0 && guessCount < 4) {
            score = 90
        } else if (guessCount > 4 && guessCount < 7) {
            score = 80
        } else if (guessCount > 7 && guessCount < 11) {
            score = 70
        } else {
            score = 60
        }
    }
}
