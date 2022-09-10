//
//  ContentView.swift
//  TrafficLightSwiftUI
//
//  Created by Vasiliy on 10.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonText = "Start"
    @State private var currentLight = CurrentLight.green

    @State private var greenSircle = CircleView(color: .green, contrast: 0.5)
    @State private var yellowSircle = CircleView(color: .yellow, contrast: 0.5)
    @State private var redSircle = CircleView(color: .red, contrast: 0.5)

    var body: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea()
            VStack {
                VStack {
                    greenSircle
                    yellowSircle
                    redSircle
                }
                Spacer()
                Button(action: { turnLight() } ) {
                    Text("\(buttonText)")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .padding(.init(
                            top: 10,
                            leading: 30,
                            bottom: 10,
                            trailing: 30
                        ))
                        .background(Color.black)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 4)
                        )
                }
            }
        }
    }
    private func turnLight() {
        if buttonText == "Start" {
            buttonText = "Next"
        }

        switch currentLight {
        case .green:
            greenSircle = CircleView(color: .green, contrast: 1)
            yellowSircle = CircleView(color: .yellow, contrast: 0.5)
            redSircle = CircleView(color: .red, contrast: 0.5)
            currentLight = .yellow
        case .yellow:
            greenSircle = CircleView(color: .green, contrast: 0.5)
            yellowSircle = CircleView(color: .yellow, contrast: 1)
            redSircle = CircleView(color: .red, contrast: 0.5)
            currentLight = .red
        case .red:
            greenSircle = CircleView(color: .green, contrast: 0.5)
            yellowSircle = CircleView(color: .yellow, contrast: 0.5)
            redSircle = CircleView(color: .red, contrast: 1)
            currentLight = .green
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    enum CurrentLight {
        case green, yellow, red
    }
}

