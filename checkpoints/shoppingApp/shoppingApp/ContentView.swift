//
//  ContentView.swift
//  shoppingApp
//
//  Created by Vedant Mistry on 15/12/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var cartModel = CartModel()
    
    @State private var data: [Product] = []
    
    @State private var id: Int = 0
    @State private var title: String = ""
    @State private var price: Double = 0.0
    @State private var description: String = ""
    @State private var image: String = ""
    
    var body: some View {
        TabView {
            AllProducts_View(data: $data, cartModel: cartModel, id: $id, title: $title, price: $price, description: $description, image: $image)
                .background(Color(hex: "FDFFF7"))
                .onAppear {
                    fetchProductsData()
                }
                .tabItem {
                    Label("All Products", systemImage: "magnifyingglass.circle.fill")
                }
            
            CartView(cartItems: $cartModel.cartItems)
                .background(Color(hex: "FDFFF7"))
                .tabItem {
                    Label("Your Cart", systemImage: "cart.circle.fill")
                }
        }
    }
    
    private func fetchProductsData() {
        guard let url = URL(string: "https://fakestoreapi.com/products") else { return }
            
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode([Product].self, from: data)
                    
                DispatchQueue.main.async {
                    self.data = decodedData
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}

#Preview {
    ContentView()
}
