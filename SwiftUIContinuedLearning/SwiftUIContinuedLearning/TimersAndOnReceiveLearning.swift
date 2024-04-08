//
//  TimersAndOnReceiveLearning.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 01/04/24.
//

import SwiftUI
import Combine

struct TimersAndOnReceiveLearning: View {
    // this timer is a publisher, basically publishes a value over a certain time span, over time
    let timer = Timer.publish(every: 3.0,
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
    /*
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
     */
    
    // animation counter
    @State var count = 1
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color.pink, Color.indigo],
                           center: .topLeading,
                           startRadius: 50,
                           endRadius: 400)
            .ignoresSafeArea()
            
//            Text(dateFormatter.string(from: currentDate))
//            Text(finishedText ?? "\(count)")
//            Text(timeRemaining)
//                .font(.system(size: 30))
//                .fontWeight(.heavy)
//                .foregroundStyle(Color.white)
            
//            HStack(spacing: 20) {
//                Circle()
//                    .offset(y: count == 1 ? -40 : 0)
//                Circle()
//                    .offset(y: count == 2 ? -40 : 0)
//                Circle()
//                    .offset(y: count == 3 ? -40 : 0)
//            }
//            .frame(width: 150)
//            .foregroundStyle(Color.white)
            
            TabView(selection: $count,
                    content:  {
                Rectangle()
                    .foregroundStyle(Color.green)
                    .tag(1)
                Rectangle()
                    .foregroundStyle(Color.purple)
                    .tag(2)
                Rectangle()
                    .foregroundStyle(Color.yellow)
                    .tag(3)
                Rectangle()
                    .foregroundStyle(Color.orange)
                    .tag(4)
                Rectangle()
                    .foregroundStyle(Color.teal)
                    .tag(5)
                Rectangle()
                    .foregroundStyle(Color.blue)
                    .tag(6)
                Rectangle()
                    .foregroundStyle(Color.mint)
                    .tag(7)
                Rectangle()
                    .foregroundStyle(Color.pink)
                    .tag(8)
            })
            .padding()
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            .tabViewStyle(PageTabViewStyle())
        }
        .onReceive(timer, perform: { _ in
//            updateTimeRemaining()
            withAnimation(.default) {
                count = (count == 8) ? 1 : (count + 1)
            }
        })
    }
}

#Preview {
    TimersAndOnReceiveLearning()
}
