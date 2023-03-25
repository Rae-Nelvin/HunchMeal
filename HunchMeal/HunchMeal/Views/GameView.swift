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
                                SmallCardView(photo: food.image)
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 25, leading: 0, bottom: 0, trailing: 0))
                    CustomNavigationBar(gbvm: gbvm,showLandingPage: $showLandingPage, showTimerButton: true, showHintButton: true)
                    HStack(alignment: .bottom){
                        VStack(alignment: .leading){
                            Text("Turn \(String(format: "%02d", gbvm.totalGuess + 1))")
                                .font(.system(size:32, design: .rounded).weight(.bold))
                                .foregroundColor(Color("Yellow"))
                            AskQuestionButton()
                        }
                        Image("SusCat")
                            .resizable()
                            .frame(width: 122, height: 160)
                    }
                }
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
    var photo: String
    
    var body: some View {
        HStack(){
            Image(photo)
                .resizable()
                .padding(6)
                .frame(width: 66.75, height: 89)
                .background(Color("LightYellow"))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("Purple"), lineWidth: 4))
                .onLongPressGesture(minimumDuration: 2){
                    print("tapped")
                }
        }
    }
}

struct CustomNavigationBar: View{
    @StateObject var gbvm: GameBoardViewModel
    @Binding var showLandingPage: Bool
    var showTimerButton: Bool
    var showHintButton: Bool
    
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
                if showTimerButton {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {
                            print("Question Tapped")
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

struct AskQuestionButton: View {
    var body: some View {
        Button (action: {
            print("Ask a question tapped")
        }){
            Text("Ask a Question")
                .font(.system(size: 16, design: .rounded).weight(.bold))
                .frame(width: 204, height: 51)
                .foregroundColor(Color("Yellow"))
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color("Yellow"), lineWidth: 4))
        }
    }
}
