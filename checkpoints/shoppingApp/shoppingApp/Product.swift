//
//  Product.swift
//  shoppingApp
//
//  Created by Vedant Mistry on 15/12/23.
//

import Foundation

struct Product: Codable, Identifiable, Equatable {
    var id: Int
    var title: String
    var price: Double
    var description: String
    var image: String
}
