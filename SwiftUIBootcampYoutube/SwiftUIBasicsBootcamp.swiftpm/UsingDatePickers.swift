//
//  UsingDatePickers.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 12/03/24.
//

import SwiftUI

struct UsingDatePickers: View {
    @State var selectedDate: Date = Date()
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date()
    let endingDate: Date = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        
        return formatter
    }
    
    var body: some View {
        VStack {
            Text("Selected date is:")
            Text("\(dateFormatter.string(from: selectedDate))")
            
            //        DatePicker("Select a Date", selection: $selectedDate)
            //        DatePicker("Select a date",
            //                   selection: $selectedDate,
            //                   displayedComponents: [.date])
                    DatePicker("Date again?",
                               selection: $selectedDate, in: startingDate...endingDate)
                        .datePickerStyle(CompactDatePickerStyle())
            //            .datePickerStyle(GraphicalDatePickerStyle())
            //            .datePickerStyle(WheelDatePickerStyle())
        }
    }
}

#Preview {
    UsingDatePickers()
}
