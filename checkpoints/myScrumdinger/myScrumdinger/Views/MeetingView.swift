//
//  ContentView.swift
//  myScrumdinger
//
//  Created by Vedant Mistry on 25/10/23.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.filled")
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.filled")
                }
            }
//            accessibility labels to describe the stack elements.
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("10 minutes")
            
            Circle()
                .strokeBorder(lineWidth: 24.0)
            
            HStack {
                Text("Speaker 1 of 3")
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next Speaker")
            }
        }
        .padding()
    }
}

#Preview {
    MeetingView()
}
