//
//  CartModel.swift
//  shoppingApp
//
//  Created by Vedant Mistry on 16/12/23.
//

import Foundation

class CartModel: ObservableObject {
    @Published var cartItems: [Product] = []
}
