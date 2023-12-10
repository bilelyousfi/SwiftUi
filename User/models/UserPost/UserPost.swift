//
//  UserPost.swift
//  Ecoshop
//
//  Created by gataga on 10/12/2023.
//

import Foundation
struct UserPost:Codable,Identifiable{
    var id:String
    var username:String
    init(){
        id = ""
        username = ""
    }
}
