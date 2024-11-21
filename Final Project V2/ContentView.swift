//
//  ContentView.swift
//  Final Project V2
//
//  Created by Tyler Berlin on 11/14/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    H1CustomText(text:"Welcome to Magic 8Ball")
                        .font(.title).bold()
                    Image("Icon").resizable().frame(width: 150, height: 150)
                    H2CustomText(text:"Pick your 8Ball style and let the magic begin!")
                        .font(.title2).bold()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    NavigationLink("Regular 8 Ball", destination: EightBall(phrase: "Regular Magic 8 Ball"))
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .buttonStyle(CustomButtonStyle())
                    NavigationLink("Mean 8 Ball", destination: EightBall(phrase: "Mean 8 Ball"))
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .buttonStyle(CustomButtonStyle())
                    NavigationLink("Nice 8 Ball", destination: EightBall(phrase: "Nice 8 Ball"))
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .buttonStyle(CustomButtonStyle())
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct H1CustomText: View {
    let text: String
    var body: some View {
        Text(text).font(Font.custom("Futura Bold", size: 25))
            .foregroundColor(.blue)
    }
}

struct H2CustomText: View {
    let text: String
    var body: some View {
        Text(text).font(Font.custom("Futura Bold", size: 15))
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 130)
            .font(Font.custom("Futura Medium Italic", size: 20))
            .padding()
            .background(.blue).opacity(configuration.isPressed ? 0.0 : 1.0)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
