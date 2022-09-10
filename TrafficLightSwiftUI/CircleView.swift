//
//  CircleView.swift
//  TrafficLightSwiftUI
//
//  Created by Vasiliy on 10.09.2022.
//

import SwiftUI

struct CircleView: View {
    let color: Color
    let contrast: Double

    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: 150, height: 150)
            .contrast(contrast)
            .overlay(Circle().stroke(Color.black, lineWidth: 4))
            .padding(.init(top: 16, leading: 0, bottom: 0, trailing: 0))
            

            
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(color: .red, contrast: 1)
    }
}
