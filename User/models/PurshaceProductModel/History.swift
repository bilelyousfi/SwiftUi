//
//  History.swift
//  Ecoshop
//
//  Created by MacOS on 3/12/2023.
//

import Foundation


struct History: Identifiable, Decodable {
    var id: String
    var userId:  User
    var productId:  PurshaceProduct
    var date: [Date]
}

struct FetchHistoryResponse: Decodable {
    let history: [History]
    let statusCode: Int
}


