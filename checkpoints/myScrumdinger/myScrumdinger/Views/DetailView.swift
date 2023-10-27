//
//  DetailView.swift
//  myScrumdinger
//
//  Created by Vedant Mistry on 25/10/23.
//

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text("\(scrum.theme.name)")
                        .padding(5)
                        .foregroundStyle(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .clipShape(RoundedRectangle(cornerRadius: 5.0))
                }
            }
            
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label("\(attendee.name)", systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
    }
}

#Preview {
    NavigationStack {
        DetailView(scrum: DailyScrum.sampleData[0])
    }
}
