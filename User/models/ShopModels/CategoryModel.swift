//
//  CategoryModel.swift
//  Ecoshop
//
//  Created by Badis Aloui on 6/12/2023.
//

import SwiftUI

struct CategoryModel: Identifiable, Hashable {
    var id: UUID = .init()
    var icon: String
    var title: String
}

var categoryList: [CategoryModel] = [
    CategoryModel(icon: "", title: "All"),
    CategoryModel(icon: "grocery" , title: "Grocery"),
    CategoryModel(icon: "furniture" , title: "Furniture"),
    CategoryModel(icon: "clothes" , title: "Clothes"),
]
