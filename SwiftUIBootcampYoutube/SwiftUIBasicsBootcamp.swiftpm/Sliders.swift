//
//  Sliders.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 12/03/24.
//

import SwiftUI

struct Sliders: View {
    @State var sliderValue: Double = 1.0
    @State var color: Color = .red
    
    var body: some View {
//        Text("Slider value: \(Int(sliderValue))")
        Text(
            String(format: "%.2f", sliderValue)
        )
        .foregroundStyle(color)
        
//        Slider(value: $sliderValue)
//        Slider(value: $sliderValue, in: 0...100)
//        Slider(value: $sliderValue, in: 0...5, step: 1.0)
        Slider(
            value: $sliderValue,
            in: 1...5,
            step: 1.0,
            onEditingChanged: { _ in
                color = .green
            },
            minimumValueLabel: Text("1"),
            maximumValueLabel: Text("5"),
            label: {
                Text("Title")
                    .foregroundStyle(Color.black)
            })
            .tint(Color.green)
    }
}

#Preview {
    Sliders()
}
