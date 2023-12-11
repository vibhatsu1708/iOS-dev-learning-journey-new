import SwiftUI

struct MonthView: View {
    var monthExpenses: [String: [Any]] = [
        "burger": [123.45, "burger at burger king"],
        "pizza": [123.45, "pizza at papa johns"],
        "coffee": [25.0, "morning coffee at Starbucks"],
        "groceries": [150.0, "weekly groceries at supermarket"],
        "movie": [20.0, "movie night with friends"],
        "gas": [50.0, "fuel for the car"]
    ]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("1230.45$")
                    Spacer()
                    Button {
                        
                    } label: {
                        Label("Add Item", systemImage: "plus.circle.fill")
                            .padding()
                            .foregroundStyle(.white)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                List {
                    ForEach(monthExpenses.sorted(by: { $0.key > $1.key }), id: \.key) { key, value in
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(key)
                                        .font(.title2)
                                        .bold()
                                    Text("1/12/2024")
                                        .font(.subheadline)
                                        .foregroundStyle(Color.gray)
                                }
                                Text(value[1] as! String)
                            }
                            Spacer()
                            Text("\(value[0] as! Double, specifier: "%.2f")")
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .bold()
                                .background(Color.green)
                                .clipShape(RoundedRectangle(cornerRadius: 100.0))
                                .foregroundStyle(Color.black)
                        }
                    }
                }
            }
            .navigationTitle("January")
        }
    }
}

struct MonthView_Previews: PreviewProvider {
    static var previews: some View {
        MonthView()
    }
}
