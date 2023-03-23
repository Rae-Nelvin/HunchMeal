//
//  GameView.swift
//  HunchMeal
//
//  Created by Jihan Alfiyyah Munajat on 22/03/23.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        NavigationView{
            ZStack(){
                Circle()
                    .foregroundColor(Color("Yellow"))
                    .frame(width: 753, height: 753)
                    .fixedSize()
                    .offset(y: -160)
                VStack(){
                    HStack(){
                        Image(systemName: "photo")
//                                .foregroundColor(Color("LightYellow"))
                            
                            .frame(width: 66.75, height: 89)
                            .background(Color("LightYellow"))
                            .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("Purple"), lineWidth: 4))
                            .onLongPressGesture(minimumDuration: 2){
                                print("tapped")
                            }
                    }
                            
                    Text("")
                        .toolbar{
                            ToolbarItem(placement: .navigationBarLeading){
                                Image(systemName: "arrow.left.square.fill")
                                    .font(.system(size: 40.0, weight: .medium))
                                    .imageScale(.large)
                                    .foregroundColor(Color("Purple"))
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
                    
                }
            }
            .padding()
            .background(Color("Purple"))
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
