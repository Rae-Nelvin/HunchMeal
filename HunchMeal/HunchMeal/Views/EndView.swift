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
            Circle()
                .foregroundColor(Color("Purple"))
                .frame(width: 753, height: 753)
                .fixedSize()
                .offset(y: -120)
            if showLandingPage {
                HunchMealView()
            } else {
                ScrollView(.vertical) {
                    VStack {
                        ZStack {
                            // Name of Food object
                            Text(gbvm.foodAnswer.name)
                                .font(.system(size: 24, design: .rounded).weight(.bold))
                                .frame(width: 267, height: 70)
                                .foregroundColor(Color("Purple"))
                                .background(Color("LightYellow"))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10).stroke(Color("Purple"), lineWidth: 4)
                                )
                                .offset(y: 165)
                            
                            // Image of Food object
                            Image(gbvm.foodAnswer.image)
                                .resizable()
                                .frame(width: 267, height: 280)
                                .background(Color("LightYellow"))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("Purple"), lineWidth: 4)
                                )
                            // based on winning status of the user
                            catView(win: gbvm.isWin)
                        }
                    }
                    Spacer(minLength: 90)
                    VStack {
                        textWinningView(win: false)
                        HStack(){
                            TotalTime(gbvm: gbvm, isTime: false)
                            TotalTime(gbvm: gbvm, isTime: true)
                        }
                        Text(gbvm.foodAnswer.name)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 32, design: .rounded).weight(.bold))
                            .foregroundColor(Color("Yellow"))
                            .padding(.top, 60)
                            .padding(.bottom, 10)
                        FoodAnswerDetails(gbvm: gbvm)
                            .fixedSize()
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

struct HideNavBar: View {
    var body: some View {
        NavigationLink("", destination: HunchMealView())
    }
}

struct catView: View{
    var win: String
    
    var body: some View {
        if win == "Win" {
            Image("Cat-Head-Smug")
                .resizable()
                .frame(width: 193, height: 140)
                .offset(x: 150, y: 130)
        } else {
            Image("Cat-Head-Smug")
                .resizable()
                .frame(width: 193, height: 140)
                .offset(x: 150, y: 130)
        }
    }
}

struct textWinningView: View{
    var win: Bool
    
    var body: some View {
        if win{
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
    }
}

struct TotalTime: View {
    @StateObject var gbvm: GameBoardViewModel
    let isTime: Bool
    
    var body: some View {
        if isTime {
            VStack(){
                Text("Total \n Time")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16, design: .rounded).weight(.bold))
                    .foregroundColor(Color(.white))
                    .padding(.bottom, 4)
                
                Text("\(gbvm.countSpentTime(secondsRemaing:gbvm.secondsRemaining, totalTime: 300) / 60) : \(String(format: "%02d", gbvm.countSpentTime(secondsRemaing:gbvm.secondsRemaining, totalTime: 300) % 60))")
                    .font(.system(size: 32, design: .rounded).weight(.bold))
                    .foregroundColor(Color("Yellow"))
            }
            .frame(width: 115, height: 112)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("Yellow"), lineWidth: 4)
            )
            .padding()
        }else {
            VStack(){
                Text("Question Asked")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16, design: .rounded).weight(.bold))
                    .foregroundColor(Color(.white))
                    .padding(.bottom, 4)
                
                Text("\(gbvm.totalGuess)")
                    .font(.system(size: 32, design: .rounded).weight(.bold))
                    .foregroundColor(Color("Yellow"))
            }
            .frame(width: 115, height: 112)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("Yellow"), lineWidth: 4)
            )
            .padding()
        }
    }
}

struct FoodAnswerDetails: View {
    @StateObject var gbvm: GameBoardViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack(alignment: .top, spacing: 50){
                VStack() {
                    FoodAnswerDetailText(text: "Taste")
                    Text(gbvm.foodAnswer.type.type)
                        .font(.system(size: 16, design: .rounded).weight(.bold))
                        .multilineTextAlignment(.center)
                        .frame(width: 90)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(EdgeInsets(top: 5, leading: 2, bottom: 5, trailing: 2))
                        .lineLimit(nil)
                        .foregroundColor(Color("Purple"))
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("Yellow")))
                }
                VStack(spacing: 15){
                    FoodAnswerDetailText(text: "Taste")
                    VStack(alignment: .center) {
                        ForEach(gbvm.foodAnswer.taste, id: \.id) { taste in
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
            HStack(alignment: .top, spacing: 50){
                VStack() {
                    FoodAnswerDetailText(text: "Process")
                    Text(gbvm.foodAnswer.cookProcesses.process)
                        .font(.system(size: 16, design: .rounded).weight(.bold))
                        .multilineTextAlignment(.center)
                        .frame(width: 90)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(EdgeInsets(top: 5, leading: 2, bottom: 5, trailing: 2))
                        .lineLimit(nil)
                        .foregroundColor(Color("Purple"))
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("Yellow")))
                }
                VStack(spacing: 15){
                    FoodAnswerDetailText(text: "Ingredients")
                    VStack(alignment: .center) {
                        ForEach(gbvm.foodAnswer.ingredient, id: \.id) { ingredient in
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
        }
    }
}

struct FoodAnswerDetailText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 16, design: .rounded).weight(.bold))
            .foregroundColor(Color("Yellow"))
    }
}
