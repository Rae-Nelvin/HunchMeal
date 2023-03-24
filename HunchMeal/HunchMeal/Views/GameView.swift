//
//  GameView.swift
//  HunchMeal
//
//  Created by Jihan Alfiyyah Munajat on 22/03/23.
//

import SwiftUI

struct GameView: View {
    @State private var showLandingPage = false

    var body: some View {
        ZStack(){
            BackgroundYellowCircle()
            
            if showLandingPage {
                HunchMealView()
            }
            else{
                VStack(){
                    HStack(){
                        SmallCardView()
                        SmallCardView()
                        SmallCardView()
                        SmallCardView()
                    }
                    HStack(){
                        SmallCardView()
                        SmallCardView()
                        SmallCardView()
                        SmallCardView()
                    }
                    HStack(){
                        SmallCardView()
                        SmallCardView()
                        SmallCardView()
                        SmallCardView()
                    }
                    HStack(){
                        SmallCardView()
                        SmallCardView()
                        SmallCardView()
                        SmallCardView()
                    }
                    HStack(){
                        SmallCardView()
                        SmallCardView()
                        SmallCardView()
                        SmallCardView()
                    }
                    .padding(.bottom, 125)
                    
                    
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
                                Image(systemName: "questionmark.square.fill")
                                    .font(.system(size: 40.0, weight: .medium))
                                    .imageScale(.large)
                                    .foregroundColor(Color("Purple"))
                            }
                            
                            ToolbarItem(placement: .principal){
                                Text("00:00")
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
    
    var body: some View {
        HStack(){
            Image(systemName: "photo")
            //                                .foregroundColor(Color("LightYellow"))
            
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
