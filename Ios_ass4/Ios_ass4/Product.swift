//
//  Product.swift
//  Ios_ass4
//
//  Created by Chanzhe on 2022/5/14.
//

import UIKit

class Product: Codable {
    
    var id: Int
    var name: String
    var cover: String
    var images: [String]
    var rating: Int
    var price: Double
}
