//
//  Comment.swift
//  Ecoshop
//
//  Created by gataga on 2/12/2023.
//

import Foundation

struct Comment:Codable,Identifiable{
    
    
    
    var id:String
    var content:String
    var iduser:String
    var idpost:String
    var __v:Int
    
    enum Codingkeys :String, CodingKey{
        case id = "_id"
        case content
        case iduser
        case idpost
        case __v
    }
  
    
}
