//
//  DatePickerControl.swift
//  Controls
//
//  Created by Vedant Mistry on 02/11/23.
//

import SwiftUI

struct DatePickerControl: View {
    @State var selectedDate = Date()
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .day, value: -365*10, to: Date())!
        let max = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
        return min...max
    }
    
    var body: some View {
        Form {
            Section {
                DatePicker("Pick a Date", selection: $selectedDate, in: dateClosedRange, displayedComponents: .date)
            }
        }
    }
}

#Preview {
    DatePickerControl()
}
