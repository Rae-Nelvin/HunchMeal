//
//  HunchMealView.swift
//  HunchMeal
//
//  Created by Leonardo Wijaya on 21/03/23.
//

import SwiftUI

struct HunchMealView: View {
    var body: some View {
        ZStack() {
            Circle()
                .foregroundColor(Color("Yellow"))
                .frame(width: 753, height: 753)
                .fixedSize()
                .offset(y: -160)
            
            VStack{
                Text("Hunch")
                    .font(.system(size: 88, weight: .bold))
                    .foregroundColor(Color("Purple"))
                    .navigationBarTitleDisplayMode(.inline)
                    .offset(y: -98)
                Text("Meal")
                    .font(.system(size: 88, weight: .bold))
                    .foregroundColor(Color("Purple"))
                    .navigationBarTitleDisplayMode(.inline)
                    .offset(y: -98)
                
            
                
                Button(action: {
                    print("tapped")
                }){
                    Text("PLAY")
                        .font(.system(size: 36, weight: .bold))
                        .frame(width: 146, height: 146)
                        .foregroundColor(Color("Yellow"))
                        .background(Color("Purple"))
                        .clipShape(Circle())
                        .offset(y: -21)
                }

                
            }
        }
        .padding()
        .background(Color("Purple"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HunchMealView()
    }
}
