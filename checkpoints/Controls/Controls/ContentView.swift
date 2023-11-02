//
//  ContentView.swift
//  Controls
//
//  Created by Vedant Mistry on 02/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedView: Int = 1
    var body: some View {
        VStack {
            Picker("Select a View", selection: $selectedView) {
                Text("Simple Button").tag(1)
                Text("Toggle").tag(2)
                Text("Steppers").tag(3)
                Text("Sliders").tag(4)
                Text("Date Picker").tag(5)
            }.pickerStyle(.wheel)
            
            Spacer()
            
            switch selectedView {
            case 1:
                ButtonControl()
            case 2:
                ToggleControl()
            case 3:
                StepperControl()
            case 4:
                SliderControl()
            case 5:
                DatePickerControl()
            default:
                ButtonControl()
            }
        }
    }
}

#Preview {
    ContentView()
}
