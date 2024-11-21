//
//  EightBall.swift
//  Final Project V2
//
//  Created by Tyler Berlin on 11/14/24.
//

import SwiftUI

struct EightBall: View {
    @State var randomValue = 0
    @State var rotation = 0.0
    @State var userQuestion = "" // User's question
    let phrase: String
    var body: some View {
        ZStack {
            // Sets the background to black
            Color.black.ignoresSafeArea()
            VStack {
                // Displays the phrase from ContentView
                H1CustomText(text:(phrase))
                    .font(.title).bold()
                    .foregroundColor(Color.white)
                    .padding(.top, 40)
                
                // Displays the 8-ball image with rotation animations
                Image("pips \(randomValue)")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
                    .padding(.top, 150)
                    .rotationEffect(.degrees(rotation))
                    .rotation3DEffect(.degrees(rotation), axis: (x: 1, y: 1, z: 0))
                
                Spacer()
                    .padding(.bottom, 50)
                
                VStack {
                    // Input field for the user to type their question
                    TextField("Ask your question...", text: $userQuestion)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.black)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                    
                    //Button to trigger the "Ask Question" action. Only works if there is a question in the TextField
                    Button("Ask Question") {
                        if !userQuestion.isEmpty {
                            chooseRandom(times: 3)
                            withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)) {
                                rotation += 720 // Spins the 8-ball image
                            }
                        }
                    }
                    .buttonStyle(CustomButtonStyle())
                    //Makes the user hit the "Reset" button to ask another question after they have gotton a answer to the previus question.
                    .disabled(randomValue != 0 || userQuestion.isEmpty)
                    Button("Reset") {
                        resetToOriginal()
                    }
                    .buttonStyle(CustomButtonStyle())
                }
            }
        }
    }
    //Resets Everthing
    func resetToOriginal() {
        randomValue = 0
        rotation = 0
        userQuestion = ""
    }
    
    // Responses vary based on the mode selected by the user. If the user selects "Normal," the responses will mimic those of a traditional Magic 8-Ball. If they choose "Nice," only positive responses will be displayed. On the other hand, selecting "Mean" will generate negative or rude responses.
    func chooseRandom(times: Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if phrase.contains("Mean") {
                    randomValue = Int.random(in: 11...20)
                } else if phrase.contains("Nice") {
                    randomValue = Int.random(in: 1...10)
                } else if phrase.contains("Regular") {
                    randomValue = Int.random(in: 1...20)
                } else if phrase.contains("Special"){
                    randomValue = Int.random(in: 21...30)
                }
                chooseRandom(times: times - 1)
            }
        }
    }
}

// Preview for testing
struct EightBall_Previews: PreviewProvider {
    static var previews: some View {
        EightBall(phrase: "")
    }
}
