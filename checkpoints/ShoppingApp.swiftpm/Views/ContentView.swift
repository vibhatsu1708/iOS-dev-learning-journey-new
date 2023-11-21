import SwiftUI

struct ContentView: View {
    @StateObject private var cartModel = Cart_Model()
    
    var body: some View {
        TabView {
            ShopNow_View(categories_model: Categories_Model(), cartModel: cartModel)
                .tabItem { 
                    Label("Shop Now", systemImage: "cart.badge.plus")
                }
            
            Cart_View(cartItems: $cartModel.cartItems)
                .tabItem { 
                    Label("Cart", systemImage: "cart.circle")
                }
            
            Account_View(account_model: Account_Model())
                .tabItem { 
                    Label("Account", systemImage: "person.circle")
                }
        }
    }
}
