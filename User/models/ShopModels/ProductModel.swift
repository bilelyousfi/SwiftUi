//
//  ProductModel.swift
//  Ecoshop
//
//  Created by Badis Aloui on 6/12/2023.
//

import SwiftUI

// Product Model
struct Product: Identifiable {
    var id: UUID = .init()
    var name: String
    var category: String
    var image: String
    var color: Color
    var price: Int
}

//Sample Products
var productList = [
    Product(name:"Sun Butter", category: "Grocery", image: "butter", color: .pink, price: 10),
    Product(name:"Organic Juice", category: "Grocery", image: "juice", color: .yellow, price: 2),
    Product(name:"Oat Milk", category: "Grocery", image: "milk", color: .red, price: 20),
    Product(name:"Sofa", category: "Furniture", image: "sofa", color: .green, price: 250),
    Product(name:"Wood Chair", category: "Furniture", image: "chair", color: .blue, price: 100),
    Product(name:"Wood Table", category: "Furniture", image: "table", color: .brown, price: 150),
    Product(name:"Cotton Shirt", category: "Clothes", image: "shirt", color: .orange, price: 40),
    Product(name:"Fiber Shoes", category: "Clothes", image: "shoes", color: .purple, price: 70),
    Product(name:"Leather Skirt", category: "Clothes", image: "skirt", color: .mint, price: 80),
]

