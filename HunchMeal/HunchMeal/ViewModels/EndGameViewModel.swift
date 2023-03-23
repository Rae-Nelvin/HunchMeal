//
//  EndGameViewModel.swift
//  HunchMeal
//
//  Created by Leonardo Wijaya on 22/03/23.
//

import Foundation

class EndGameViewModel: ObservableObject {
    @Published var score: Int = 0
    
    init(guessCount: Int, isWin: Bool) {
        displayCondition(guessCount: guessCount, isWin: isWin)
    }
    
    private func displayCondition(guessCount: Int, isWin: Bool) {
        if (isWin == true) {
            // Display Win View
            countScore(guessCount: guessCount)
        } else {
            // Display Lose View
            score = 0
        }
    }
    
    private func countScore(guessCount: Int) {
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
