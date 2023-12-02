//
//  Post.swift
//  Ecoshop
//
//  Created by gataga on 2/12/2023.
//
//@ . [ ] - = _ \  / "" ' ' ! ? { }
import Foundation

struct Post:Codable,Identifiable{
    var id:String
    var content:String
    var publicationDate:String
    var likes:[String]
   // var media:String
    var iduser:String
    
    
}
