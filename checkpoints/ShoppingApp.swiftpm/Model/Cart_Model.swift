import SwiftUI

class Cart_Model: ObservableObject {
    @Published var cartItems: [String: [String]] = [:]
}
