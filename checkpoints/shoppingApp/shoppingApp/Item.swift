//
//  Item.swift
//  shoppingApp
//
//  Created by Vedant Mistry on 26/12/23.
//

import Foundation

struct Item: Codable, Identifiable, Equatable {
    var id: Int
    var name: String
    var brand_name: String
    var sku: String
    var price: String
    
}
