//
//  AllProducts_View.swift
//  shoppingApp
//
//  Created by Vedant Mistry on 15/12/23.
//

import SwiftUI

struct AllProducts_View: View {
    @Binding var data: [Product]
    
    @ObservedObject var cartModel: CartModel
    
    @State private var itemAddedIndication: Bool = false
    
    @State private var searchText: String = ""
    
    @Binding var id: Int
    @Binding var title: String
    @Binding var price: Double
    @Binding var description: String
    @Binding var image: String
    
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach($data, id: \.id) { $product in
                            HStack(alignment: .top) {
                                AsyncImage(url: URL(string: "\(product.image)")) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 60, height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                                VStack(alignment: .leading) {
                                    Text(product.title)
                                        .bold()
                                    Text(String(format: "%.2f", product.price))
                                    Text(product.description)
                                    Button {
                                        cartModel.cartItems.append(product)
                                        
                                        itemAddedIndication = true
                                        
                                    } label: {
                                        Label("Add to Cart", systemImage: "cart.fill.badge.plus")
                                    }
                                    .bold()
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color(hex: "FFC145"))
                                    .foregroundStyle(Color.black)
                                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                                }
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .searchable(text: $searchText)
            .frame(maxWidth: .infinity)
        }
    }
}

