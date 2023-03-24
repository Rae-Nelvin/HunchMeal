//
//  GameBoardViewModel.swift
//  HunchMeal
//
//  Created by Leonardo Wijaya on 22/03/23.
//

import SwiftUI

class GameBoardViewModel: ObservableObject {
    @Published var isWin: Bool = false
    @Published var totalGuess: Int = 0
    @Published var chosenQuestion: [Question] = []
    @Published var foodDatas: [Food]
    @Published var foodAnswer: Food
    @Published var secondsRemaining: Int = 300
    @Published var timeRunning: Bool
    
    init() {
        var datas: [Food] = []
        var selectedObjectIds = Set<UUID>()
        
        for _ in 0..<20 {
            let shuffledObjects = FoodLists.lists.shuffled()
            let data = shuffledObjects.prefix(1)[0]
            if !selectedObjectIds.contains(data.id) {
                datas.append(data)
                selectedObjectIds.insert(data.id)
            }
        }
        let shuffledObjects = datas.shuffled()
        let data = shuffledObjects.prefix(1)[0]
        self.foodDatas = datas
        self.foodAnswer = data
        self.timeRunning = true
    }
    
    func showQuestions() -> [Question] {
        var randomNumber: Int = 0
        var questions: [Question] = []
        var question: Question = Question(part1: "", part2: "")
        
        // Generate 1 correct question
        repeat {
            randomNumber = Int.random(in: 1...5)
            switch randomNumber {
            case 1:
                question = Question(part1: "Is this food type of", part2: foodAnswer.type.type)
                break
            case 2:
                question = Question(part1: "Is this food came from", part2: "\(getRandomFoodOrigin(lists: foodAnswer.origin))")
                break
            case 3:
                question = Question(part1: "Is this food made by", part2: foodAnswer.cookProcesses.process)
                break
            case 4:
                question = Question(part1: "Is this food taste", part2: "\(getRandomFoodTaste(lists: foodAnswer.taste))")
                break
            case 5:
                question = Question(part1: "Is one of this food ingredient a", part2: "\(getRandomFoodIngredient(lists: foodAnswer.ingredient))")
                break
            default:
                break
            }
        }  while (checkQuestion(question: question) == false)
        questions.append(question)
        
        // Generate 3 random questions
        for _ in 0..<3 {
            repeat {
                randomNumber = Int.random(in: 1...5)
                question = getRandomQuestions(randomNumber: randomNumber)
            } while (checkQuestion(question: question) == false)
            questions.append(question)
        }
        
        return questions
    }
    
    func askQuestion(question: Question) -> String {
        totalGuess += 1
        chosenQuestion.append(question)
        if (getAnswer(question: question) == true) {
            return "Yes it is!"
        }
        return "No, it is not"
    }
    
    func eliminateCard(_ index: Int) {
        foodDatas[index].isElim = true
        checkWin()
    }
    
    // Win Conditional
    func checkWin() {
        var count: Int = 0
        for i in 0..<foodDatas.count {
            if (foodDatas[i].isElim == true) {
                count += 1
            }
        }
        
        if (timeRunning == false) {
            isWin = false
        }
        if (count == foodDatas.count - 1 && checkAnswer() == true) {
            isWin = true
        } else {
            isWin = false
        }
    }
    
    func startTimer() {
        if timeRunning {
            if secondsRemaining > 0 {
                secondsRemaining -= 0
            } else {
                timeRunning = false
            }
        }
    }
    
    private func getRandomQuestions(randomNumber: Int) -> Question {
        switch randomNumber {
        case 1:
            return Question(part1: "Is this food type of", part2: getRandomFoodType(lists: FoodTypeLists.lists).type)
        case 2:
            return Question(part1: "Is this food came from", part2: getRandomFoodOrigin(lists: FoodOriginLists.lists).origin)
        case 3:
            return Question(part1: "Is this food made by", part2: getRandomFoodProcesses(lists: FoodProcessesList.lists).process)
        case 4:
            return Question(part1: "Is this food taste", part2: getRandomFoodTaste(lists: FoodTasteLists.lists).taste)
        case 5:
            return Question(part1: "Is one of this food ingredient a", part2: getRandomFoodIngredient(lists: FoodIngredientLists.lists).ingredient)
        default:
            return Question(part1: "", part2: "")
        }
    }
    
    private func getRandomFoodType(lists: [FoodType]) -> FoodType {
        let shuffledObjects = lists.shuffled()
        let data = shuffledObjects.prefix(1)[0]
        
        return data
    }
    
    private func getRandomFoodOrigin(lists: [FoodOrigin]) -> FoodOrigin {
        let shuffledObjects = lists.shuffled()
        let data = shuffledObjects.prefix(1)[0]
        
        return data
    }
    
    private func getRandomFoodProcesses(lists: [FoodProcesses]) -> FoodProcesses {
        let shuffledObjects = lists.shuffled()
        let data = shuffledObjects.prefix(1)[0]
        
        return data
    }
    
    private func getRandomFoodTaste(lists: [FoodTaste]) -> FoodTaste {
        let shuffledObjects = lists.shuffled()
        let data = shuffledObjects.prefix(1)[0]
        
        return data
    }
    
    private func getRandomFoodIngredient(lists: [FoodIngredient]) -> FoodIngredient {
        let shuffledObjects = lists.shuffled()
        let data = shuffledObjects.prefix(1)[0]
        
        return data
    }
    
    private func getAnswer(question: Question) -> Bool {
        if (question.part2 == foodAnswer.type.type) {
            return true
        }
        if (foodAnswer.origin.contains(where: { $0.origin == question.part2 } )) {
            return true
        }
        if (question.part2 == foodAnswer.cookProcesses.process) {
            return true
        }
        if (foodAnswer.taste.contains(where: { $0.taste == question.part2 } )) {
            return true
        }
        if (foodAnswer.ingredient.contains(where: { $0.ingredient == question.part2} )) {
            return true
        }
        
        return false
    }
    
    private func checkQuestion(question: Question) -> Bool {
        return chosenQuestion.contains(where: { $0.part2 == question.part2 })
    }
    
    private func checkAnswer() -> Bool {
        var answer: Food = Food(name: "",image: "", type: FoodType(type: ""), origin: [], cookProcesses: FoodProcesses(process: ""), taste: [], ingredient: [])
        
        for i in 0..<foodDatas.count {
            if (foodDatas[i].isElim == false) {
                answer = foodDatas[i]
            }
        }
        
        if (answer.id == foodAnswer.id) {
            return true
        }
        
        return false
    }
}
