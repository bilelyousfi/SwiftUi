//
//  PurshaceProduct.swift
//  Ecoshop
//
//  Created by MacOS on 29/11/2023.
//

import Foundation


struct PurshaceProduct : Codable, Hashable {
    var _id : String
    var name: String
    var description: String
    var image: String
    var code: String
    var carbonFootPrint: String
    var waterConsumption: String
    var recyclability: String
}

struct fetchPurshaceProductResponse : Decodable {
    let products : [PurshaceProduct]
    let statusCode: Int
}
