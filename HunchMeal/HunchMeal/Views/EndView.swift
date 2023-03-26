//
//  EndView.swift
//  HunchMeal
//
//  Created by Jihan Alfiyyah Munajat on 25/03/23.
//

import SwiftUI

struct EndView: View {
    @State private var showLandingPage = false
    var win: Bool
    
    var body: some View {
        ScrollView {
            VStack() {
                ZStack() {
                    BackgroundYellowCircle()
                    if showLandingPage{
                        HunchMealView()
                    } else {
                        CustomNavigationBar(gbvm: GameBoardViewModel(), showLandingPage: $showLandingPage, showTimerButton: false, showHintButton: false)
                        if win {
                            Text("Bakcang")
                                .font(.system(size: 24, design: .rounded).weight(.bold))
                                .frame(width: 267, height: 70)
                                .foregroundColor(Color("Purple"))
                                .background(Color("LightYellow"))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10).stroke(Color("Purple"), lineWidth: 4)
                                )
                                .offset(y: 165)
                            Image("Bakcang")
                                .resizable()
                                .frame(width: 267, height: 280)
                                .background(Color("LightYellow"))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("Purple"), lineWidth: 4)
                                )
                            Image("WinCat")
                            .resizable()
                            .frame(width: 193, height: 140)
                            .offset(x: 120, y: 130)
                        }

                    }
                    
                }
                Spacer(minLength: -50)
            }
            Text("You Figured")
                .font(.system(size: 48, design: .rounded).weight(.bold))
                .foregroundColor(Color("Yellow"))
            Text("It Out!")
                .font(.system(size: 48, design: .rounded).weight(.bold))
                .foregroundColor(Color("Yellow"))

        }
        .background(Color(("Purple")))
    }
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        EndView(win: true)
    }
}
