//
//  PostCardBody.swift
//  Ecoshop
//
//  Created by hassen gataga on 30/11/2023.
//

import SwiftUI

struct PostCardBody: View {
    let content:String
    let likes_count:String
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
                    Image("starbucks")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .roundedCorner(20, corners: [.bottomLeft, .topRight, .bottomRight])
                    
                    HStack {
                        HStack(spacing: 3) {
                            Image(systemName: "heart")
                            Text(likes_count)
                        }
                        Spacer()
                        HStack {
                            Image(systemName: "text.bubble")
                            Text("09")
                        }
                       
                        
                    }
                    .font(.callout)
                    
                    Text(content)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .font(.callout)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 55)
            }
    }


struct PostCardBody_Previews: PreviewProvider {
    static var previews: some View {
        PostCardBody(content: "fdgfhfghjg", likes_count: "20")
    }
}
