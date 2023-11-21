import SwiftUI

struct Account: Identifiable {
    let id = UUID()
    let accountName: String
    let accountNumber: String
    let accountEmail: String
    let accountAddress: String
    let accountImage: String
}

class Account_Model: ObservableObject {
    @Published var account: [Account] = [
        Account(accountName: "Loki Odinson", 
                accountNumber: "0123456789", 
                accountEmail: "loki@asgard.com", 
                accountAddress: "At the end of Time",
                accountImage: "loki")
    ]
}
