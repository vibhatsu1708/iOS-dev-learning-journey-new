import SwiftUI

struct Account_View: View {
    @ObservedObject var account_model: Account_Model
    
    var body: some View {
        NavigationStack {
            List(account_model.account) { item in
                Section(header: Text("Account Name")) {
                    HStack {
                        Image("loki")
                            .resizable()
                            .frame(minWidth: 60, minHeight: 60)
                            .frame(maxWidth: 100, maxHeight: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 7.5))
                        
                        Text(item.accountName)
                            .padding(.leading)
                            .fontWeight(.bold)
                    }
                    .font(.title)
                }
                
                Section(header: Text("Account Email & Contact Number")) {
                    VStack(alignment: .leading) {
                        Text(item.accountEmail)
                        Text(item.accountNumber)
                    }
                }
                
                Section(header: Text("Order Address")) {
                    VStack(alignment: .leading) {
                        Text(item.accountAddress)
                    }
                }
            }
            .navigationTitle("Account")
        }
    }
}
