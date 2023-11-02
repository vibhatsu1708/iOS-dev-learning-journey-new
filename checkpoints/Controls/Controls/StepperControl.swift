//
//  StepperControl.swift
//  Controls
//
//  Created by Vedant Mistry on 02/11/23.
//

import SwiftUI

struct StepperControl: View {
    @State private var count: Int = 1
    
    var body: some View {
        VStack {
            Text("Stepper value: \(count)")
            Stepper("Number: ", value: $count, in: 1...20)
        }
        .padding()
    }
}

#Preview {
    StepperControl()
}
