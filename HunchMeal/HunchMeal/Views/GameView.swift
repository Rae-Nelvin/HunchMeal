//
//  GameView.swift
//  HunchMeal
//
//  Created by Jihan Alfiyyah Munajat on 22/03/23.
//

import SwiftUI

struct GameView: View {
    @StateObject var gbv = GameBoardViewModel()
    @State private var showLandingPage = false
    
    var body: some View {
        ZStack(){
            BackgroundYellowCircle()
            if showLandingPage{
                HunchMealView()
            } else {
                VStack(){
                    VStack() {
                        ForEach(0..<5) { _ in
                            HStack() {
                                ForEach(0..<4) { _ in
                                    SmallCardView(photo: "photo")
                                }
                            }
                        }
                        CustomNavigationBar(gbv: gbv,showLandingPage: $showLandingPage)
                        
                        HStack(alignment: .bottom){
                            VStack(alignment: .leading){
                                Text("Turn 05")
                                    .font(.system(size:32, design: .rounded).weight(.bold))
                                    .foregroundColor(Color("Yellow"))
                                
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
                            
                            Image("SusCat")
                                .resizable()
                                .frame(width: 122, height: 180)
                        }
                        .frame(height: 150)

                    }
                }
//                .padding(.bottom, 125)
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
            Image(systemName: photo)
                .frame(width: 66.75, height: 89)
                .background(Color("LightYellow"))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("Purple"), lineWidth: 4))
                .padding(6)
                .onLongPressGesture(minimumDuration: 2){
                    print("tapped")
                }
        }
    }
}

struct CustomNavigationBar: View{
    @StateObject var gbv: GameBoardViewModel
    @Binding var showLandingPage:Bool
    
    var body: some View {
        NavigationLink("", destination: HunchMealView())
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button (action: {
                        showLandingPage = true
                    }){
                        Image(systemName: "arrow.left.square.fill")
                            .font(.system(size: 40.0, weight: .medium))
                            .imageScale(.large)
                            .foregroundColor(Color("Purple"))
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        print("Question Tapped")
                    }){
                        Image(systemName: "questionmark.square.fill")
                            .font(.system(size: 40.0, weight: .medium))
                            .imageScale(.large)
                            .foregroundColor(Color("Purple"))
                    }
                }
                
                ToolbarItem(placement: .principal){
                    Text("\(gbv.secondsRemaining / 60) : \(String(format: "%02d", gbv.secondsRemaining % 60))")
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
            .navigationBarBackButtonHidden(true)
            .onAppear() {
                gbv.startTimer()
            }
            .onDisappear() {
                gbv.stopTimer()
            }
    }
}

