//
//  PostCardHeader.swift
//  Ecoshop
//
//  Created by hassen gataga on 30/11/2023.
//

import SwiftUI

struct PostCardHeader: View {
    
    var body: some View {
        HStack{
            Image("")
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: 40,height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack{
                Text("HASSEN MRAKBEN").bold()
                Text("")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
            }
            Spacer()
            Image(systemName: "ellipsis")
        }
    }
}

struct PostCardHeader_Previews: PreviewProvider {
    static var previews: some View {
        PostCardHeader()
    }
}
