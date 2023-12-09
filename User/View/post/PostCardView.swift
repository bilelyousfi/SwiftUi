//
//  PostCardView.swift
//  Ecoshop
//
//  Created by gataga on 9/12/2023.
//

import SwiftUI

struct PostCardView: View {
      @State var author : String
      @State var content : String
      @State var id : String
      @State var datepub : String
      @State var count_likes : String
    
    var body: some View {
        VStack{
            HStack{
                Image("obida")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 40,height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                VStack{
                    Text(author).bold()
                    Text(datepub)
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                }
                Spacer()
                Image(systemName: "ellipsis")
            }
            
            VStack(alignment: .leading, spacing: 15) {
                        Image("starbucks")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .roundedCorner(20, corners: [.bottomLeft, .topRight, .bottomRight])
                        
                        HStack {
                            HStack(spacing: 3) {
                                Image(systemName: "heart")
                                Text(count_likes)
                            }
                            Spacer()
                            HStack {
                                NavigationLink( destination: CommentsView(idpost: id)){
                                    Image(systemName: "text.bubble")
                                        .foregroundColor(.gray)
                                    }
                                Text("")
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
    }


struct PostCardView_Previews: PreviewProvider {
    static var previews: some View {
        PostCardView(author: "hassen",  content: "ffffff", id: "000", datepub: "01/01/2023", count_likes: "0")
    }
}
