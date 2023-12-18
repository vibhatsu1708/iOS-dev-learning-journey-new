//
//  Cart_View.swift
//  shoppingApp
//
//  Created by Vedant Mistry on 16/12/23.
//

import SwiftUI

struct CartView: View {
    @Binding var cartItems: [Product]
    @StateObject private var cartModel = CartModel()
    
    @State private var searchText: String = ""
    @State private var filteredCartItems: [Product] = []
    
    @State private var totalAmount: Double = 0.0
    
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    if cartItems.isEmpty {
                        VStack(alignment: .center) {
                            Text("Oh so empty...")
                                .font(.title2)
                            Text("Click on ")
                                .font(.title2)
                            +
                            Text("All Products")
                                .font(.title2)
                                .fontWeight(.bold)
                            +
                            Text(" to get started.")
                                .font(.title2)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                    }
                    
                    VStack(alignment: .leading) {
                        ForEach($cartItems, id: \.id) { $cartItem in
                            HStack(alignment: .top) {
                                AsyncImage(url: URL(string: "\(cartItem.image)")) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 60, height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                                VStack(alignment: .leading) {
                                    Text(cartItem.title)
                                        .bold()
                                    Text(String(format: "%.2f", cartItem.price))
                                    Button {
                                        deleteProduct(offset: IndexSet([cartItems.firstIndex(of: cartItem)!]))
                                    } label: {
                                        Label("Delete", systemImage: "trash.fill")
                                    }
                                    .bold()
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color(hex: "FF6B6C"))
                                    .foregroundStyle(Color.black)
                                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                                }
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                        }
                        .onDelete(perform: deleteProduct)
                    }
                }
            }
            .searchable(text: $searchText)
            .onAppear {
                updateTotalAmount()
            }
            .onChange(of: cartItems) {
                updateTotalAmount()
            }
            .padding(.bottom, 100)
            
            VStack {
                Spacer()
                VStack {
                    
                    Group {
                        Text("Your Cart Amount ")
                        +
                        Text(String(format: "%.2f", totalAmount))
                    }
                    .frame(maxWidth: .infinity)
                    .bold()
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
                    .overlay {
                        RoundedRectangle(cornerRadius: 5.0)
                            .stroke(Color.gray, lineWidth: 1)
                    }
                }
                .padding()
            }
        }
    }
    
    private func deleteProduct(offset: IndexSet) {
        cartItems.remove(atOffsets: offset)
    }
    
    private func updateTotalAmount() {
        totalAmount = calculateTotalPrice()
    }
    
    private func calculateTotalPrice() -> Double {
        return cartItems.reduce(0.0) { $0 + $1.price }
    }
}
