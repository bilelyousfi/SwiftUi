//
//  CommentItemView.swift
//  Ecoshop
//
//  Created by gataga on 9/12/2023.
//

import SwiftUI

struct CommentItemView: View {
    let nameuser:String
    let datcmt:String
    let content :String
    var body: some View {
        HStack{
            Image("obida")
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: 40,height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack{
                Text(nameuser).bold()
                Text(datcmt)
                    .font(.footnote)
                    .foregroundColor(.gray)
              
                
            }
            Spacer()
            
        }
        VStack{
            Text("comment: \(content)")
        }
    }
}

struct CommentItemView_Previews: PreviewProvider {
    static var previews: some View {
        CommentItemView(nameuser: "bado", datcmt: "/01/01/2023", content: "yalla")
    }
}
