//
//  PostCardHeader.swift
//  Ecoshop
//
//  Created by hassen gataga on 30/11/2023.
//

import SwiftUI

struct PostCardHeader: View {
  
    let nameuser:String
    let datpub:String
    
    var body: some View {
        HStack{
            Image("obida")
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: 40,height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack{
                Text(nameuser).bold()
                Text(datpub)
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
        PostCardHeader(nameuser: "hassen",datpub: "01/01/12023")
    }
}
