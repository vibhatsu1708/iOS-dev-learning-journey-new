//
//  TimersAndOnReceiveLearning.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 01/04/24.
//

import SwiftUI
import Combine

struct TimersAndOnReceiveLearning: View {
    let timer = Timer.publish(every: 1.0,
                              on: .main,
                              in: .common).autoconnect()
    
    // to get the current date
    /*
    @State var currentDate: Date = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        
        return formatter
    }*/
    
    // countdown
    /*
    @State var count: Int = 10
    @State var finishedText: String? = nil
     */
    
    // countdown to date
    @State var timeRemaining: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .hour,
                                                 value: 1,
                                                 to: Date()) ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second],
                                                        from: Date(),
                                                        to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(hour): \(minute): \(second)"
        
    }
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color.pink, Color.indigo],
                           center: .topLeading,
                           startRadius: 50,
                           endRadius: 400)
            .ignoresSafeArea()
            
//            Text(dateFormatter.string(from: currentDate))
//            Text(finishedText ?? "\(count)")
            Text(timeRemaining)
                .font(.system(size: 30))
                .fontWeight(.heavy)
                .foregroundStyle(Color.white)
        }
        .onReceive(timer, perform: { _ in
            updateTimeRemaining()
        })
    }
}

#Preview {
    TimersAndOnReceiveLearning()
}
