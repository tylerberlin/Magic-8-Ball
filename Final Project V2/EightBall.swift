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
    @State var userQuestion = "" // String that holds The user's question.
    @State var isTextFieldDisabled = false //Boolean to determin whether to dissable TextField or not.
    let sounds = ["sound1", "sound2", "sound3", "sound4", "sound5", "sound6", "sound7", "sound8", "sound9", "sound10","sound11", "sound12", "sound13", "sound14", "sound15","sound16", "sound17", "sound18","sound19", "sound20"]
    let phrase: String
    let soundPlayer = Sounds()
    var body: some View {
        ZStack {
            // Displays the background to black
            Color.black.ignoresSafeArea()
            VStack {
                // Shows the phrase selected from ContentView
                HeadingCustomText(text:(phrase))
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
                    // Users TextField to ask their question.
                    TextField("Ask your question...", text: $userQuestion)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.blue)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .disabled(isTextFieldDisabled)
                    
                    // Button to trigger the "Ask Question" action. Only works if there is a question in the TextField. User hits enter and then it disables the user from typing in the TextField.
                    Button("Enter") {
                        if !userQuestion.isEmpty {
                            chooseRandom(times: 3)
                            withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)) {
                                rotation += 720 // Spins the 8-ball image
                            }
                            isTextFieldDisabled = true
                        }
                    }
                    .buttonStyle(CustomButtonStyle())
                    // Makes the user hit the "Reset" button to ask another question after they have gotten an answer to the previous question.
                    .disabled(randomValue != 0 || userQuestion.isEmpty)
                    Button("Reset") {
                        resetToOriginal()
                    }
                    .buttonStyle(CustomButtonStyle())
                }
            }
        }
    }
    // Resets Everything
    func resetToOriginal() {
        randomValue = 0
        rotation = 0
        userQuestion = ""
        isTextFieldDisabled = false
    }
    // Responses vary based on the mode selected by the user. If the user selects "Normal," the responses will mimic a traditional Magic 8-Ball. If they choose "Nice," only positive responses will be displayed. On the other hand, selecting "Mean" will generate negative responses.
    func chooseRandom(times: Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                if self.phrase.contains("Mean") {
                    self.randomValue = Int.random(in: 11...20)
                } else if self.phrase.contains("Nice") {
                    self.randomValue = Int.random(in: 1...10)
                } else if self.phrase.contains("Regular") {
                    self.randomValue = Int.random(in: 1...20)
                }
                self.chooseRandom(times: times - 1)
            }
        }
        else {
            playSoundForCurrentValue()
        }
    }
    //The playSoundForCurrentValue function decides which sound to play based on a number called randomValue. It first checks if the number is within the range of sounds available(1-20). If it is, it finds the matching sound in a list and plays it.
    func playSoundForCurrentValue() {
        if (1...sounds.count).contains(randomValue) {
            soundPlayer.playSound(named: sounds[randomValue - 1])
        }
    }
}
