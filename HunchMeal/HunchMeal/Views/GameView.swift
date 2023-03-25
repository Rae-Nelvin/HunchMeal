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
    
    var body: some View {
        ZStack(){
            BackgroundYellowCircle()
            if showLandingPage{
                HunchMealView()
            } else {
                VStack() {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(gbvm.foodDatas, id: \.id) { food in
                            VStack {
                                SmallCardView(gbvm: gbvm, food: food)
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 25, leading: 0, bottom: 0, trailing: 0))
                    CustomNavigationBar(gbvm: gbvm,showLandingPage: $showLandingPage)
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
                        }
                    }
                )
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
    var food: Food
    
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
                //                .onLongPressGesture(minimumDuration: 2){
                //                    print("tapped")
                //                }
                    .onTapGesture {
                        print("tapped")
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

struct CustomNavigationBar: View{
    @StateObject var gbvm: GameBoardViewModel
    @Binding var showLandingPage:Bool
    
    var body: some View {
        NavigationLink("", destination: HunchMealView())
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button (action: {
                        showLandingPage = true
                    }){
                        CustomNavigationToolBarImage(image: "arrow.left.square.fill")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        print("Question Tapped")
                    }){
                        CustomNavigationToolBarImage(image: "questionmark.square.fill")
                    }
                }
                ToolbarItem(placement: .principal){
                    CustomToolBarCountdownTimer(gbvm: gbvm)
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
