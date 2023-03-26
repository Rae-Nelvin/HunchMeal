//
//  GameView.swift
//  HunchMeal
//
//  Created by Jihan Alfiyyah Munajat on 22/03/23.
//

import SwiftUI

struct GameView: View {
    @StateObject var gbvm = GameBoardViewModel()
    @State private var showLandingPage = false
    private let columns: [GridItem] = Array(repeating: .init(.fixed(90)), count: 4)
    @State var showLargeCard: Bool = false
    @State var selectedFood: Food?
    @State var showRulesView: Bool = false
    @State var showExitConfirmation: Bool = false
    
    // for passing Food objects to End View
    @State var win: Bool = true
    
    var body: some View {
        ZStack(){
            BackgroundYellowCircle()
            if showLandingPage{
                HunchMealView()
            } else if gbvm.isWin != "" {
                EndView()
                    .environmentObject(gbvm)
            } else {
                VStack() {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(gbvm.foodDatas, id: \.id) { food in
                            SmallCardView(gbvm: gbvm, food: food, showLargeCard: $showLargeCard)
                                .onLongPressGesture(minimumDuration: 1.0, perform: {
                                    selectedFood = food
                                    if selectedFood?.isElim != true {
                                        showLargeCard = true
                                    }
                                })
                                .sheet(isPresented: $showLargeCard) {
                                    LargeCardView(food: $selectedFood)
                                        .onTapGesture {
                                            showLargeCard = false
                                        }
                                }
                        }
                    }
                    .padding(EdgeInsets(top: 25, leading: 0, bottom: 0, trailing: 0))
                    CustomNavigationBar(gbvm: gbvm,showLandingPage: $showLandingPage, showRulesView: $showRulesView, showExitConfirmation: $showExitConfirmation, showTimer: true, showHintButton: true)
                    BottomPartGameView()
                        .environmentObject(gbvm)
                }
                .overlay(
                    Group {
                        if gbvm.isShowQuestionLayout {
                            QuestionLayout()
                                .environmentObject(gbvm)
                                .onTapGesture {
                                    gbvm.isShowQuestionLayout = false
                                }
                        } else if showRulesView {
                            RulesView()
                                .onTapGesture {
                                    showRulesView = false
                                }
                                .edgesIgnoringSafeArea(.all)
                        } else if showExitConfirmation {
                            ExitConfirmation(showLandingPage: $showLandingPage, showExitConfirmation: $showExitConfirmation)
                                .edgesIgnoringSafeArea(.all)
                        }
                    }
                )
                .scaledToFit()
                .padding(.top, 20)
            }
        }
        .padding()
        .background(Color("Purple"))
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

struct SmallCardView: View {
    @StateObject var gbvm: GameBoardViewModel
    let food: Food
    @Binding var showLargeCard: Bool
    
    var body: some View {
        HStack(){
            if !food.isElim {
                Image(food.image)
                    .resizable()
                    .padding(6)
                    .frame(width: 66.75, height: 89)
                    .background(Color("LightYellow"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("Purple"), lineWidth: 4))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            gbvm.eliminateCard(food: food)
                        }
                    }
                    .rotation3DEffect(.degrees(food.isElim ? 180 : 0), axis: (x: 0, y:1, z:0))
            } else {
                VStack {
                }
                .padding(6)
                .frame(width: 66.75, height: 89)
                .background(Color("LightYellow"))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("Purple"), lineWidth: 4))
                .rotation3DEffect(.degrees(food.isElim ? 180 : 0), axis: (x: 0, y:1, z:0))
            }
        }
    }
}

struct LargeCardView: View {
    @Binding var food: Food?
    
    var body: some View {
        ZStack {
            Color("LightYellow")
            VStack {
                Image(food?.image ?? "")
                    .resizable()
                    .background(Color("LightYellow"))
                Text(food?.name ?? "")
                    .font(.system(size: 24, design: .rounded).weight(.bold))
                    .foregroundColor(Color("Purple"))
                    .frame(height: 80)


            }
        }
        .cornerRadius(40)
        .padding(40)
    }
}

struct CustomNavigationBar: View{
    @StateObject var gbvm: GameBoardViewModel
    @Binding var showLandingPage: Bool
    @Binding var showRulesView: Bool
    @Binding var showExitConfirmation: Bool
    var showTimer: Bool
    var showHintButton: Bool
    // Nanti kl uda ada logic menangnya, passing status true/false ya buat endView
    
    var body: some View {
        NavigationLink("", destination: HunchMealView())
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button (action: {
                        showExitConfirmation = true
                    }){
                        CustomNavigationToolBarImage(image: "arrow.left.square.fill")
                    }
                }
                if showTimer{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {
                            showRulesView = true
                        }){
                            CustomNavigationToolBarImage(image: "questionmark.square.fill")
                        }
                    }
                }
                if showHintButton {
                    ToolbarItem(placement: .principal){
                        CustomToolBarCountdownTimer(gbvm: gbvm)
                    }
                }
                
            }
            .navigationBarBackButtonHidden(true)
            .onAppear() {
                gbvm.startTimer()
            }
            .onDisappear() {
                gbvm.stopTimer()
            }
    }
}

struct CustomNavigationToolBarImage: View {
    var image: String
    
    var body: some View {
        Image(systemName: image)
            .font(.system(size: 40.0, weight: .medium))
            .imageScale(.large)
            .foregroundColor(Color("Purple"))
    }
}

struct CustomToolBarCountdownTimer: View {
    @StateObject var gbvm: GameBoardViewModel
    
    var body: some View {
        Text("\(gbvm.secondsRemaining / 60) : \(String(format: "%02d", gbvm.secondsRemaining % 60))")
            .frame(width: 80.0, height: 25.0)
            .padding(9)
            .font(.system(size: 24, design: .rounded).weight(.bold))
            .foregroundColor(Color("Purple"))
            .overlay(
                RoundedRectangle(cornerRadius: 7)
                    .stroke(Color("Purple"), lineWidth: 4))
            .imageScale(.large)
    }
}

struct RulesView: View {
    let rules: [Rules] = RulesList.lists
    
    var body: some View {
        ZStack {
            Color("LightYellow")
            VStack {
                Text("Rules of the Game")
                    .font(.system(size: 24, design: .rounded).weight(.bold))
                    .foregroundColor(Color("Purple"))
                    .padding(.bottom, 10)
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(Array(rules.enumerated()), id: \.1) { index, rule in
                        Text("\(index + 1). \(rule.rules)")
                            .font(.system(size: 16, design: .rounded).weight(.bold))
                            .foregroundColor(Color("Purple"))
                            .padding(.bottom, 8)
                    }
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 140, leading: 20, bottom: 0, trailing: 20))
        }
    }
}

struct ExitConfirmation: View {
    @Binding var showLandingPage: Bool
    @Binding var showExitConfirmation: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7)
                .padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: -10))
            VStack {
                VStack {
                    Text("Give up and return\nto main menu?")
                }
                .font(.system(size: 24, design: .rounded).weight(.bold))
                .multilineTextAlignment(.center)
                .foregroundColor(Color("Purple"))
                
                HStack(spacing: 40) {
                    Text("Cancel")
                        .font(.system(size: 16, design: .rounded).weight(.bold))
                        .frame(width: 90, height: 35)
                        .foregroundColor(Color("Purple"))
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color("Purple"), lineWidth: 4))
                        .onTapGesture {
                            showExitConfirmation = false
                        }
                    Text("Give Up")
                        .font(.system(size: 16, design: .rounded).weight(.bold))
                        .frame(width: 90, height: 35)
                        .foregroundColor(Color("Yellow"))
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("Purple")))
                        .onTapGesture {
                            showLandingPage = true
                        }

                }
                .padding(.top, 25)
            }
            .frame(width: 258, height: 159)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color("Yellow")))
        }
    }
}
