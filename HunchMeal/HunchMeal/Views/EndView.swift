//
//  EndView.swift
//  HunchMeal
//
//  Created by Jihan Alfiyyah Munajat on 25/03/23.
//

import SwiftUI

struct EndView: View {
    @EnvironmentObject var gbvm: GameBoardViewModel
    @State private var showLandingPage = false
    // timer, win status, question asked, Food object
    
    var body: some View {
        ScrollView {
            VStack() {
                ZStack() {
                    BackgroundYellowCircle()
                    if showLandingPage{
                        HunchMealView()
                    } else {
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
                Spacer(minLength: -90)
            }
            
            VStack() {
                // based on winning status of the user
                textWinningView(win: false)
                
                // default
                HStack(){
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

                }
                Text(gbvm.foodAnswer.name)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 32, design: .rounded).weight(.bold))
                    .foregroundColor(Color("Yellow"))
                    .padding(.top, 60)
                    .padding(.bottom, 10)
                HStack(){
                    VStack() {
                        Text("Type")
                            .font(.system(size: 16, design: .rounded).weight(.bold))
                            .foregroundColor(Color("Yellow"))
                        // Type of Food object
                        Text(gbvm.foodAnswer.type.type)
                            .font(.system(size: 16, design: .rounded).weight(.bold))
                            .multilineTextAlignment(.center)
                            .frame(width: 90)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.top, 5)
                            .padding(.bottom, 5)
                            .lineLimit(nil)
                            .foregroundColor(Color("Purple"))
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("Yellow")))
                    }
                    .padding(.trailing, 30)
                    
                    
                    VStack(){
                        Text("Taste")
                            .font(.system(size: 16, design: .rounded).weight(.bold))
                            .foregroundColor(Color("Yellow"))
                            .padding(.bottom, -2)
                        
                        LazyHGrid(rows: [GridItem(.flexible()), GridItem(.flexible())]) {
                            ForEach(gbvm.foodAnswer.taste, id: \.id) { taste in
                                Text(taste.taste)
                                    .font(.system(size: 16, design: .rounded).weight(.bold))
                                    .multilineTextAlignment(.center)
                                    .frame(width: 90)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.top, 5)
                                    .padding(.bottom, 5)
                                    .lineLimit(nil)
                                    .foregroundColor(Color("Purple"))
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("Yellow")))
                            }
                            .padding(.top, 28)
                            .padding(.leading, 10)
                            .padding(.bottom, 10)
                        }
//                        .padding(.bottom, 10)
                    }
                    .padding(.trailing, 30)

                }
                .padding(.bottom, 20)
                
                HStack(){
                    VStack() {
                        Text("Process")
                            .font(.system(size: 16, design: .rounded).weight(.bold))
                            .foregroundColor(Color("Yellow"))
                        
                        // Process of Food object
                        Text(gbvm.foodAnswer.cookProcesses.process)
                            .font(.system(size: 16, design: .rounded).weight(.bold))
                            .multilineTextAlignment(.center)
                            .frame(width: 90)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.top, 5)
                            .padding(.bottom, 5)
                            .lineLimit(nil)
                            .foregroundColor(Color("Purple"))
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("Yellow")))
                    }
                    .padding(.trailing, 30)
                    
                    
                    VStack(){
                        Text("Ingredients")
                            .font(.system(size: 16, design: .rounded).weight(.bold))
                            .foregroundColor(Color("Yellow"))
                            .padding(.bottom, -2)

                        
                        LazyHGrid(rows: [GridItem(.flexible()), GridItem(.flexible())]) {
                            ForEach(gbvm.foodAnswer.ingredient, id: \.id) { ingredient in
                                Text(ingredient.ingredient)
                                    .font(.system(size: 16, design: .rounded).weight(.bold))
                                    .multilineTextAlignment(.center)
                                    .frame(width: 90)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.top, 5)
                                    .padding(.bottom, 5)
                                    .lineLimit(nil)
                                    .foregroundColor(Color("Purple"))
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("Yellow")))
                            }
                            .padding(.top, 28)
                            .padding(.leading, 10)
                            .padding(.bottom, 10)

                        }
                        .padding(.trailing, 30)
                    }
                }
                CustomBackHomeView(showLandingPage: $showLandingPage)
            }
        }
        .background(Color(("Purple")))
    }
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        EndView()
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

