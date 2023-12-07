//
//  History.swift
//  Ecoshop
//
//  Created by MacOS on 3/12/2023.
//

import Foundation


struct History: Identifiable, Codable {
    var id: String
    var userId: String
    var productId: [PurshaceProduct]
    var date: [Date]
}

struct FetchHistoryResponse: Decodable {
    let histories: [History]
    let statusCode: Int
}


