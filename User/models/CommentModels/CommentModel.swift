//
//  CommentModel.swift
//  Ecoshop
//
//  Created by gataga on 2/12/2023.
//

import Foundation

struct CommentModel:Codable,Identifiable{
    var _id:String
    var content:String
    var iduser:String
    var idpost:String
    var date:String
    var __v:Int
}