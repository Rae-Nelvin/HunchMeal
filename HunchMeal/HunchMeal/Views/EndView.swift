//
//  EndView.swift
//  HunchMeal
//
//  Created by Jihan Alfiyyah Munajat on 25/03/23.
//

import SwiftUI

struct EndView: View {
    @EnvironmentObject var gbvm: GameBoardViewModel
    @State var showLandingPage = false
    
    var body: some View {
        ZStack {
            PurpleCircleView()
            if showLandingPage {
                HunchMealView()
            } else {
                ScrollView(.vertical) {
                    VStack {
                        ZStack {
                            FoodName(gbvm: gbvm)
                            FoodImage(gbvm: gbvm)
                            CatView(win: gbvm.isWin)
                        }
                    }
                    Spacer(minLength: 90)
                    VStack {
                        TextWinningView(win: gbvm.isWin)
                        HStack(){
                            PlayerStatus(gbvm: gbvm, isTime: false, title: "Question Asked")
                            PlayerStatus(gbvm: gbvm, isTime: true, title: "Total \n Time")
                        }
                        SecondFoodName(gbvm: gbvm)
                        FoodAnswerDetails(gbvm: gbvm)
                        CustomBackHomeView(showLandingPage: $showLandingPage)
                    }
                }
                .background(Color(("Purple")))
                .scrollIndicators(.hidden)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        EndView()
    }
}

struct PurpleCircleView: View {
    var body: some View {
        Circle()
            .foregroundColor(Color("Purple"))
            .frame(width: 753, height: 753)
            .fixedSize()
            .offset(y: -120)
    }
}

struct FoodName: View {
    @StateObject var gbvm: GameBoardViewModel
    
    var body: some View {
        Text(gbvm.foodAnswer.name)
            .font(.system(size: 24, design: .rounded).weight(.bold))
            .frame(width: 267, height: 70)
            .foregroundColor(Color("Purple"))
            .background(Color("LightYellow"))
            .overlay(
                RoundedRectangle(cornerRadius: 10).stroke(Color("Purple"), lineWidth: 4)
            )
            .offset(y: 165)
    }
}

struct FoodImage: View {
    @StateObject var gbvm: GameBoardViewModel
    
    var body: some View {
        Image(gbvm.foodAnswer.image)
            .resizable()
            .frame(width: 267, height: 280)
            .background(Color("LightYellow"))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("Purple"), lineWidth: 4)
            )
    }
}

struct CatView: View{
    var win: String
    
    var body: some View {
        if win == "Win" {
            Image("Cat-Head-Smug")
                .resizable()
                .frame(width: 193, height: 140)
                .offset(x: 150, y: 130)
        } else {
            Image("Cat-Head-Frustrated")
                .resizable()
                .frame(width: 193, height: 140)
                .offset(x: 150, y: 130)
        }
    }
}

struct TextWinningView: View{
    var win: String
    
    var body: some View {
        if win == "Win"{
            Text("You Figured\nIt Out!")
                .multilineTextAlignment(.center)
                .font(.system(size: 48, design: .rounded).weight(.bold))
                .foregroundColor(Color("Yellow"))
        } else {
            Text("You didn't\nget it...")
                .multilineTextAlignment(.center)
                .font(.system(size: 48, design: .rounded).weight(.bold))
                .foregroundColor(Color("Yellow"))
        }
    }
}

struct SecondFoodName: View {
    @StateObject var gbvm: GameBoardViewModel
    
    var body: some View {
        Text(gbvm.foodAnswer.name)
            .multilineTextAlignment(.center)
            .font(.system(size: 32, design: .rounded).weight(.bold))
            .foregroundColor(Color("Yellow"))
            .padding(.top, 60)
            .padding(.bottom, 10)
    }
}

struct CustomBackHomeView: View{
    @Binding var showLandingPage: Bool
    
    var body: some View {
        Button (action: {
            showLandingPage = true
        }){
            Text("Back to Home")
                .font(.system(size: 24, design: .rounded).weight(.bold))
                .foregroundColor(Color("Yellow"))
                .frame(width: 320, height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color("Yellow"), lineWidth: 4)
                )
                .padding(.top, 50)
        }
        .fixedSize()
    }
}

struct PlayerStatus: View {
    @StateObject var gbvm: GameBoardViewModel
    let isTime: Bool
    let title: String
    
    var body: some View {
        VStack(){
            PlayerStatusTitle(title: title)
            if isTime {
                TotalTimeSeconds(gbvm: gbvm)
            } else {
                PlayerStatusQuestionsAsked(gbvm: gbvm)
            }
            
        }
        .frame(width: 115, height: 112)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color("Yellow"), lineWidth: 4)
        )
        .padding()
    }
}

struct PlayerStatusTitle: View {
    let title: String
    
    var body: some View {
        Text(title)
            .multilineTextAlignment(.center)
            .font(.system(size: 16, design: .rounded).weight(.bold))
            .foregroundColor(Color(.white))
            .padding(.bottom, 4)
    }
}

struct TotalTimeSeconds: View {
    @StateObject var gbvm: GameBoardViewModel
    
    var body: some View {
        Text("\(gbvm.countSpentTime(secondsRemaing:gbvm.secondsRemaining, totalTime: 300) / 60) : \(String(format: "%02d", gbvm.countSpentTime(secondsRemaing:gbvm.secondsRemaining, totalTime: 300) % 60))")
            .font(.system(size: 32, design: .rounded).weight(.bold))
            .foregroundColor(Color("Yellow"))
    }
}

struct PlayerStatusQuestionsAsked: View {
    @StateObject var gbvm: GameBoardViewModel
    
    var body: some View {
        Text("\(gbvm.totalGuess)")
            .font(.system(size: 32, design: .rounded).weight(.bold))
            .foregroundColor(Color("Yellow"))
    }
}

struct FoodAnswerDetails: View {
    @StateObject var gbvm: GameBoardViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack(alignment: .top, spacing: 50){
                VStack() {
                    FoodAnswerDetailsText(text: "Type")
                    FoodAnswerDetailsType(food: gbvm.foodAnswer)
                }
                VStack(spacing: 15){
                    FoodAnswerDetailsText(text: "Taste")
                    FoodAnswerDetailsTaste(food: gbvm.foodAnswer)
                }
            }
            HStack(alignment: .top, spacing: 50){
                VStack() {
                    FoodAnswerDetailsText(text: "Process")
                    FoodAnswerDetailsProcess(food: gbvm.foodAnswer)
                }
                VStack(spacing: 15){
                    FoodAnswerDetailsText(text: "Ingredients")
                    FoodAnswerDetailsIngredients(food: gbvm.foodAnswer)
                }
            }
        }
    }
}

struct FoodAnswerDetailsType: View {
    let food: Food
    
    var body: some View {
        Text(food.type.type)
            .font(.system(size: 16, design: .rounded).weight(.bold))
            .multilineTextAlignment(.center)
            .frame(width: 90)
            .fixedSize(horizontal: false, vertical: true)
            .padding(EdgeInsets(top: 5, leading: 2, bottom: 5, trailing: 2))
            .lineLimit(nil)
            .foregroundColor(Color("Purple"))
            .background(RoundedRectangle(cornerRadius: 10).fill(Color("Yellow")))
    }
}

struct FoodAnswerDetailsTaste: View {
    let food: Food
    
    var body: some View {
        VStack(alignment: .center) {
            ForEach(food.taste, id: \.id) { taste in
                Text(taste.taste)
                    .font(.system(size: 16, design: .rounded).weight(.bold))
                    .multilineTextAlignment(.center)
                    .frame(width: 90)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(EdgeInsets(top: 5, leading: 2, bottom: 5, trailing: 2))
                    .lineLimit(nil)
                    .foregroundColor(Color("Purple"))
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("Yellow")))
            }
        }
    }
}

struct FoodAnswerDetailsProcess: View {
    let food: Food
    
    var body: some View {
        Text(food.cookProcesses.process)
            .font(.system(size: 16, design: .rounded).weight(.bold))
            .multilineTextAlignment(.center)
            .frame(width: 90)
            .fixedSize(horizontal: false, vertical: true)
            .padding(EdgeInsets(top: 5, leading: 2, bottom: 5, trailing: 2))
            .lineLimit(nil)
            .foregroundColor(Color("Purple"))
            .background(RoundedRectangle(cornerRadius: 10).fill(Color("Yellow")))
    }
}

struct FoodAnswerDetailsIngredients: View {
    let food: Food
    
    var body: some View {
        VStack(alignment: .center) {
            ForEach(food.ingredient, id: \.id) { ingredient in
                Text(ingredient.ingredient)
                    .font(.system(size: 16, design: .rounded).weight(.bold))
                    .multilineTextAlignment(.center)
                    .frame(width: 90)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(EdgeInsets(top: 5, leading: 2, bottom: 5, trailing: 2))
                    .lineLimit(nil)
                    .foregroundColor(Color("Purple"))
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("Yellow")))
            }
        }
    }
}

struct FoodAnswerDetailsText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 16, design: .rounded).weight(.bold))
            .foregroundColor(Color("Yellow"))
    }
}
