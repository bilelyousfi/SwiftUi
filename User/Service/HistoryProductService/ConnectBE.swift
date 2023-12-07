//
//  ConnectBE.swift
//  Ecoshop
//
//  Created by MacOS on 29/11/2023.
//

import Foundation
struct ConnectBE {
    
      //  static let BASE_URL = "http://localhost:3000"
    
       // static let BASE_URL = "http://192.168.1.151:9090"
        static let BASE_URL = "http://192.168.1.151:9090"
       
       //products routes
       static let fetchProductUrl = BASE_URL + "/product"

       //historique routes
       static let fetchHistoryUrl = BASE_URL + "/historique"

     
       // get all history by User Id routes
       static func getAllHistory(userId: String) -> String {
           return "\(BASE_URL)/historique/getAllHistory/\(userId)"
       }

       
       // Add Product to history
       static func addToHistory(userId: String) -> String {
           return "\(BASE_URL)/historique/addToHistory/\(userId)"
       }
}
