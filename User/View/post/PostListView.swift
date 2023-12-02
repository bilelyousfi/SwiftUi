//
//  PostListView.swift
//  Ecoshop
//
//  Created by hassen gataga on 30/11/2023.
//

import SwiftUI

struct PostListView: View {
    @StateObject private var postviewmodel = PostViewModel()
    var body: some View {
        VStack{
           ForEach(postviewmodel.posts){ post in
               Postcard(nameuser: "HASSENMRAKBEN", content: post.content, likes_count:"\(post.likes.count.formatted())",datepub: post.publicationDate)
                    .padding(.top)
                
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
