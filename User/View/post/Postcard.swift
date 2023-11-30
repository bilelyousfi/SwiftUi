//
//  Postcard.swift
//  Ecoshop
//
//  Created by hassen gataga on 30/11/2023.
//

import SwiftUI

struct Postcard: View {
    var body: some View {
        VStack{
            PostCardHeader()
            PostCardBody()
        }
    }
}

struct Postcard_Previews: PreviewProvider {
    static var previews: some View {
        Postcard()
    }
}
