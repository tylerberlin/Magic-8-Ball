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
                    HeadingCustomText(text:"Welcome to Magic 8Ball+")
                        .font(.title).bold()
                    Image("Icon").resizable().frame(width: 150, height: 150)
                    BodyCustomText(text:"Pick your 8Ball style and let the magic begin!")
                        .font(.title2).bold()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    CustomNavLink(title: "Regular 8 Ball", destination: EightBall(phrase: "Regular Magic 8 Ball"))
                    CustomNavLink(title: "Mean 8 Ball", destination: EightBall(phrase: "Mean 8 Ball"))
                    CustomNavLink(title: "Nice 8 Ball", destination: EightBall(phrase: "Nice 8 Ball"))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

//Creates custom styles for headings, body, nav link, and button for less repetition of my code

struct HeadingCustomText: View {
    let text: String
    var body: some View {
        Text(text).font(Font.custom("Futura Bold", size: 25))
            .foregroundColor(.blue)
    }
}

struct BodyCustomText: View {
    let text: String
    var body: some View {
        Text(text).font(Font.custom("Futura Bold", size: 15))
    }
}

struct CustomNavLink<Destination: View>: View {
    let title: String
    let destination: Destination
    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
                .font(Font.custom("Futura Medium Italic", size: 18.4))
                .padding()
                .frame(width: 150)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .buttonStyle(CustomButtonStyle())
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 150)
            .font(Font.custom("Futura Medium Italic", size: 20))
            .padding()
            .background(.blue).opacity(configuration.isPressed ? 0.0 : 1.0)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
