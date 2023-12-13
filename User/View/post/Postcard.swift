//
//  Postcard.swift
//  Ecoshop
//
//  Created by hassen gataga on 30/11/2023.
//

import SwiftUI

struct Postcard: View {
   // let imageuser:String
    let nameuser:String
    let content:String
    let likes_count:String
    let datepub:String
    let comment_count:String
    var body: some View {
        VStack{
            PostCardHeader( nameuser: nameuser,datpub: datepub)
            
            PostCardBody(content: content, likes_count: likes_count,comment_count:comment_count)
        }
    }
}

struct Postcard_Previews: PreviewProvider {
    static var previews: some View {
        Postcard(nameuser: "HASSEN MRAKBEN", content: "YALLA", likes_count: "20",datepub: "10/10/2023",comment_count: "08")
    }
}
