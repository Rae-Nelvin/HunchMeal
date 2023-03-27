//
//  BottomPartGameView.swift
//  HunchMeal
//
//  Created by Leonardo Wijaya on 25/03/23.
//

import SwiftUI

struct BottomPartGameView: View {
    @EnvironmentObject var gbvm: GameBoardViewModel
    
    var body: some View {
        VStack {
            if gbvm.isAsked {
                AskedBottomPartView(gbvm: gbvm)
            } else {
                DefaultBottomPartView(gbvm: gbvm)
            }
        }
    }
}

struct BottomPartView_Previews: PreviewProvider {
    static var previews: some View {
        BottomPartGameView()
    }
}

struct AskQuestionButton: View {
    @StateObject var gbvm: GameBoardViewModel
    
    var body: some View {
        Button (action: {
            gbvm.showQuestions()
            gbvm.isShowQuestionLayout = true
        }){
            AskQuestionTitle()
        }
    }
}

struct AskQuestionTitle: View {
    var body: some View {
        Text("Ask a Question")
            .font(.system(size: 16, design: .rounded).weight(.bold))
            .frame(width: 204, height: 51)
            .foregroundColor(Color("Yellow"))
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color("Yellow"), lineWidth: 4))
    }
}

struct QuestionLayout: View {
    @EnvironmentObject var gbvm: GameBoardViewModel
    private let rows: [GridItem] = Array(repeating: .init(.fixed(90)), count: 4)
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
                .padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: -10))
            VStack(alignment: .center) {
                LazyHGrid(rows: rows, spacing: 20) {
                    ForEach(gbvm.questions, id: \.id) { question in
                        QuestionsButton(question: question, gbvm: gbvm)
                    }
                }
            }
        }
        .onTapGesture {
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct QuestionsButton: View {
    var question: Question
    @StateObject var gbvm: GameBoardViewModel
    
    var body: some View {
        Button (action: {
            gbvm.askQuestion(question: question)
            gbvm.isAsked = true
            gbvm.isShowQuestionLayout = false
        }){
            QuestionsText(question: question)
        }
    }
}

struct QuestionsText: View {
    var question: Question
    
    var body: some View {
        Text("\(question.part1) \(question.part2)")
            .font(.system(size: 16, design: .rounded).weight(.bold))
            .padding(20)
            .foregroundColor(Color("Yellow"))
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color("Yellow"), lineWidth: 4))
    }
}

struct DefaultBottomPartView: View {
    @StateObject var gbvm: GameBoardViewModel
    
    var body: some View {
        HStack(alignment: .bottom){
            VStack(alignment: .leading){
                Text("Turn \(String(format: "%02d", gbvm.totalGuess + 1))")
                    .font(.system(size:32, design: .rounded).weight(.bold))
                    .foregroundColor(Color("Yellow"))
                AskQuestionButton(gbvm: gbvm)
            }
            .padding(.bottom, 30)
            Image("Cat-Thief-Room")
                .resizable()
                .frame(width: 115, height: 198)
                .offset(y: 10)
        }
    }
}

struct AskedBottomPartView: View {
    @StateObject var gbvm: GameBoardViewModel
    
    var body: some View {
        HStack(alignment: .center){
            BotAnswerView(gbvm: gbvm)
            Spacer(minLength: 88)
            Image("Cat-Thief-Room")
                .resizable()
                .frame(width: 115, height: 198)
                .offset(y: 10)
        }
        .scaledToFit()
    }
}

struct BotAnswerView: View {
    @StateObject var gbvm: GameBoardViewModel
    
    var body: some View {
        Text(gbvm.botAnswer)
            .font(.system(size: 16, design: .rounded).weight(.bold))
            .padding(20)
            .foregroundColor(Color("Yellow"))
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color("Yellow"), lineWidth: 4))
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    gbvm.isAsked = false
                }
            }
            .padding(.top, 35)
    }
}
