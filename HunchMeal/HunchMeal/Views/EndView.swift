//
//  EndView.swift
//  HunchMeal
//
//  Created by Jihan Alfiyyah Munajat on 25/03/23.
//

import SwiftUI

struct EndView: View {
    @State private var showLandingPage = false
    @State var showRulesView: Bool = false
    @State var showExitConfirmation: Bool = false
    // timer, win status, question asked, Food object
    
    var body: some View {
        ScrollView {
            VStack() {
                ZStack() {
                    BackgroundYellowCircle()
                    if showLandingPage{
                        HunchMealView()
                    } else {
                        CustomNavigationBar(gbvm: GameBoardViewModel(), showLandingPage: $showLandingPage, showRulesView: $showRulesView, showExitConfirmation: $showExitConfirmation, showTimer: false, showHintButton: false)
                        
                        // Name of Food object
                        Text("Es Pisang Hijau")
                            .font(.system(size: 24, design: .rounded).weight(.bold))
                            .frame(width: 267, height: 70)
                            .foregroundColor(Color("Purple"))
                            .background(Color("LightYellow"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10).stroke(Color("Purple"), lineWidth: 4)
                            )
                            .offset(y: 165)
                        
                        // Image of Food object
                        Image("Es-Pisang-Ijo")
                            .resizable()
                            .frame(width: 267, height: 280)
                            .background(Color("LightYellow"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("Purple"), lineWidth: 4)
                            )
                        
                        // based on winning status of the user
                        if true {
                            // parameter dibind sm winning status
                            catView(win: false)
                        }

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

                        Text("07")
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

                        Text("15:00")
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
                Text("Es Pisang Hijau")
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
                        
                        // Taste of Food object
                        Text("Dessert")
                            .font(.system(size: 16, design: .rounded).weight(.bold))
                            .frame(width: 90, height: 35)
                            .foregroundColor(Color("Purple"))
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("Yellow")))
                    }
                    .padding(.trailing, 30)
                    
                    
                    VStack(){
                        Text("Taste")
                            .font(.system(size: 16, design: .rounded).weight(.bold))
                            .foregroundColor(Color("Yellow"))
                        
                        // Nanti pake LazyHGrid aja le
                        HStack(){
                            // Taste of Food object
                            Text("Tasty")
                                .font(.system(size: 16, design: .rounded).weight(.bold))
                                .frame(width: 90, height: 35)
                                .foregroundColor(Color("Purple"))
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("Yellow")))
                            
                            Text("Tasty")
                                .font(.system(size: 16, design: .rounded).weight(.bold))
                                .frame(width: 90, height: 35)
                                .foregroundColor(Color("Purple"))
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("Yellow")))

                        }

                    }
                }
                .padding(.bottom, 20)
                
                HStack(){
                    VStack() {
                        Text("Process")
                            .font(.system(size: 16, design: .rounded).weight(.bold))
                            .foregroundColor(Color("Yellow"))
                        
                        // Process of Food object
                        Text("Freezed")
                            .font(.system(size: 16, design: .rounded).weight(.bold))
                            .frame(width: 90, height: 35)
                            .foregroundColor(Color("Purple"))
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("Yellow")))
                    }
                    .padding(.trailing, 30)
                    
                    
                    VStack(){
                        Text("Ingredients")
                            .font(.system(size: 16, design: .rounded).weight(.bold))
                            .foregroundColor(Color("Yellow"))
                        
                        HStack(){
                            // Ingredients of Food object
                            Text("Fruits")
                                .font(.system(size: 16, design: .rounded).weight(.bold))
                                .frame(width: 90, height: 35)
                                .foregroundColor(Color("Purple"))
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("Yellow")))
                            
                            Text("Dairy")
                                .font(.system(size: 16, design: .rounded).weight(.bold))
                                .frame(width: 90, height: 35)
                                .foregroundColor(Color("Purple"))
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("Yellow")))

                        }
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
    var win: Bool
    
    var body: some View {
        if win{
            Image("WinCat")
                .resizable()
                .frame(width: 193, height: 140)
                .offset(x: 120, y: 130)
        } else {
            Image("LoseCat")
                .resizable()
                .frame(width: 193, height: 140)
                .offset(x: 120, y: 130)
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

