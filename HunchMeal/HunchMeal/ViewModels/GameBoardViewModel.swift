//
//  GameBoardViewModel.swift
//  HunchMeal
//
//  Created by Leonardo Wijaya on 22/03/23.
//

import SwiftUI
import Combine

final class GameBoardViewModel: ObservableObject {
    @Published var isWin: String = ""
    @Published var totalGuess: Int = 0
    @Published var chosenQuestion: [Question] = []
    @Published var foodDatas: [Food]
    @Published var foodAnswer: Food
    @Published var secondsRemaining: Int = 300
    @Published var questions: [Question]
    @Published var isShowQuestionLayout: Bool = false
    @Published var isShowLargeCardView: Bool = false
    @Published var isAsked: Bool = false
    @Published var botAnswer: String = ""
    private var timer: Timer?
    private var flag: Int = 0
    
    init() {
        var datas: [Food] = []
        var selectedObjectIds = Set<UUID>()
        
        repeat {
            let shuffledObjects = FoodLists.lists.shuffled()
            let data = shuffledObjects.prefix(1)[0]
            if !selectedObjectIds.contains(data.id) {
                datas.append(data)
                selectedObjectIds.insert(data.id)
            }
        } while(datas.count < 20)
        let shuffledObjects = datas.shuffled()
        let data = shuffledObjects.prefix(1)[0]
        self.foodDatas = datas
        self.foodAnswer = data
        self.questions = []
        self.flag = countFlag()
    }
    
    func showQuestions() {
        var randomNumber: Int = 0
        questions = []
        var question: Question = Question(part1: "", part2: "")
        
        if (flag > 0) {
            for _ in 0..<1 {
                flag -= 1
                repeat {
                    randomNumber = Int.random(in: 1...5)
                    switch randomNumber {
                    case 1:
                        question = Question(part1: "Is this food type of", part2: foodAnswer.type.type)
                        break
                    case 2:
                        question = Question(part1: "Is this food came from", part2: "\(getRandomFoodOrigin(lists: foodAnswer.origin).origin)")
                        break
                    case 3:
                        question = Question(part1: "Is this food made by", part2: foodAnswer.cookProcesses.process)
                        break
                    case 4:
                        question = Question(part1: "Is this food taste", part2: "\(getRandomFoodTaste(lists: foodAnswer.taste).taste)")
                        break
                    case 5:
                        question = Question(part1: "Is one of this food ingredient a", part2: "\(getRandomFoodIngredient(lists: foodAnswer.ingredient).ingredient)")
                        break
                    default:
                        break
                    }
                }  while (checkQuestion(question: question) == true)
                questions.append(question)
            }
        }
        getAmountRandomQuestions()
        
        questions = questions.shuffled()
    }
    
    func askQuestion(question: Question) {
        totalGuess += 1
        chosenQuestion.append(question)
        if (getAnswer(question: question) == true) {
            botAnswer = "Yes it is!"
        } else {
            botAnswer =  "No, it is not"
        }
    }
    
    func eliminateCard(food: Food) {
        var i: Int = 0
        while(i < foodDatas.count) {
            if(food.id == foodDatas[i].id) {
                foodDatas[i].isElim = true
                break
            }
            i += 1
        }
        checkWin()
    }
    
    func checkWin() {
        var count: Int = 0
        for i in 0..<foodDatas.count {
            if (foodDatas[i].isElim == true) {
                count += 1
            }
        }
        
        if ((secondsRemaining == 0 && count < foodDatas.count) || (secondsRemaining == 0 && checkAnswer() == false) || (count == foodDatas.count - 1 && checkAnswer() == false)) {
            isWin = "Lose"
            stopTimer()
        }
        if (count == foodDatas.count - 1 && checkAnswer() == true) {
            isWin = "Win"
            stopTimer()
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            if self.secondsRemaining > 0 {
                self.secondsRemaining -= 1
            } else {
                self.stopTimer()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func countFlag() -> Int {
        flag += foodAnswer.cookProcesses.process.count
        flag += foodAnswer.origin.count
        flag += foodAnswer.ingredient.count
        flag += foodAnswer.taste.count
        flag += foodAnswer.type.type.count
        return flag
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
    
    private func getAmountRandomQuestions() {
        var question: Question = Question(part1: "", part2: "")
        if(flag > 0) {
            for _ in 0..<3 {
                repeat {
                    let randomNumber = Int.random(in: 1...5)
                    question = getRandomQuestions(randomNumber: randomNumber)
                } while (checkQuestion(question: question) == true)
                questions.append(question)
            }
        } else {
            for _ in 0..<4 {
                repeat {
                    let randomNumber = Int.random(in: 1...5)
                    question = getRandomQuestions(randomNumber: randomNumber)
                } while (checkQuestion(question: question) == true)
                questions.append(question)
            }
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
    
    func countSpentTime(secondsRemaing: Int, totalTime: Int) -> Int{
        return totalTime - secondsRemaing
    }
}
