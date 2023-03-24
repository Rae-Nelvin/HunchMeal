//
//  HunchMealView.swift
//  HunchMeal
//
//  Created by Leonardo Wijaya on 21/03/23.
//

import SwiftUI

struct HunchMealView: View {
    @State var navigated = false

    var body: some View {
        NavigationStack(){
            ZStack() {
                BackgroundYellowCircle()
                VStack{
                    TitleText(text: "Hunch")
                    TitleText(text: "Meal")
                    NavigationLink(destination: GameView()){
                        ButtonText(text: "PLAY")
                    }
                    
                }
            }
            .padding()
            .background(Color("Purple"))
        }
        .navigationBarBackButtonHidden(true)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HunchMealView()
    }
}

struct BackgroundYellowCircle: View {
    var body: some View {
        Circle()
            .foregroundColor(Color("Yellow"))
            .frame(width: 753, height: 753)
            .fixedSize()
            .offset(y: -120)
    }
}

struct TitleText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(size:88, design: .rounded).weight(.bold))
            .foregroundColor(Color("Purple"))
            .navigationBarTitleDisplayMode(.inline)
            .offset(y: -98)
    }
}

struct ButtonText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(size:36, design: .rounded).weight(.bold))
            .frame(width: 146, height: 146)
            .foregroundColor(Color("Yellow"))
            .background(Color("Purple"))
            .clipShape(Circle())
            .offset(y: -21)
    }
}
