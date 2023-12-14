//
//  PostListView.swift
//  Ecoshop
//
//  Created by hassen gataga on 30/11/2023.
//

import SwiftUI

struct PostListView: View {
    @StateObject private var postviewmodel = PostViewModel()
    @StateObject private var commentviewmodel = CommentViewModel()
    var body: some View {
        VStack{
            ForEach(postviewmodel.posts){ post in
             
               PostCardView(author:"HASSEN MRAKBEN", content: post.content, id: post.id, datepub: post.publicationDate, likes: post.likes,imagepost:post.media)
   
                    .padding(.top)
                
            }
           .onAppear{
                postviewmodel.getPosts()
            }
            
        }
        .listStyle(.plain) // Set the list style to plain
        .padding() // Apply padding to the VStack
        
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
