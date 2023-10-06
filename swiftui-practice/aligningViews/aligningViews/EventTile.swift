//
//  EventTile.swift
//  aligningViews
//
//  Created by Vedant Mistry on 06/10/23.
//

import SwiftUI

struct Event {
    let title: String
    let date: Date
    let location: String
    let symbol: String
}

struct EventTile: View {
    let event: Event
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: event.symbol)
                .font(.title)
            
            VStack(alignment: .leading) {
                Text(event.title)
                    .font(.title)
                    .bold()
                Text(
                    event.date,
                    format: Date.FormatStyle()
                        .day(.defaultDigits)
                        .month(.abbreviated)
                )
                Text(event.location)
                    .font(.subheadline)
            }
        }
        .padding()
        .background(Color.pink.opacity(0.8))
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
    }
}

struct EventTile_Previews: PreviewProvider {
    static let event = Event(title: "Buy Cupcakes", date: .now, location: "Starbucks", symbol: "birthday.cake.fill")
    
    static var previews: some View {
        EventTile(event: event)
    }
}
