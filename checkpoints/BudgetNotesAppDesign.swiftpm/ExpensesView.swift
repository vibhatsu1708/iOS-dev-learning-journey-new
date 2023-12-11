import SwiftUI
import UIKit

struct ExpensesView: View {
    var months: [String] = [
        "January", "February", "March", "April",
        "May", "June", "July", "August",
        "September", "October", "November", "December"
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach(months, id: \.self) { month in
                    NavigationLink(destination: MonthView()) {
                        HStack {
                            Text("\(month)")
                                .font(.title2)
                                .bold()
                            Spacer()
                            Text("123.45$")
                                .padding(10)
                                .font(.subheadline)
                                .background(Color.yellow)
                                .bold()
                                .foregroundStyle(Color.black)
                                .clipShape(RoundedRectangle(cornerRadius: 100.0))
                        }
                    }
                }
            }
            
            .navigationTitle("Your Months")
        }
    }
}
