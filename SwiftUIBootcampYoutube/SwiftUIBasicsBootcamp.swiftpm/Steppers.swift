//
//  Steppers.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 12/03/24.
//

import SwiftUI

struct Steppers: View {
    @State var stepperVar: Int = 1
    @State var radiusIncrement: Int = 0
    @State var widthChange: Int = 100
    
    var body: some View {
        Text("Learing Steppers")
        
        Stepper("Stepper: \(stepperVar)", value: $stepperVar)
            .padding(50)
        
        RoundedRectangle(cornerRadius: CGFloat(radiusIncrement))
            .frame(width: CGFloat(widthChange), height: 100)
        
        Stepper("Corner radius is: \(radiusIncrement)") {
            // increment
            incrementValues(radiusIncrementAmount: 10, widthChangeAmount: 20)
        } onDecrement: {
            // decrement
            if radiusIncrement > 0 {
                radiusIncrement -= 10
                widthChange -= 20
            }
        }
    }
    
    func incrementValues(radiusIncrementAmount: Int, widthChangeAmount: Int) {
        withAnimation(.spring) {
            radiusIncrement += radiusIncrementAmount
            widthChange += widthChangeAmount
        }
    }
}

#Preview {
    Steppers()
}
