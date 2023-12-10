//
//  CommentsView.swift
//  Ecoshop
//
//  Created by gataga on 9/12/2023.
//

import SwiftUI

struct CommentsView: View {
    let idpost:String
    @State var newCommentText : String = ""
    @StateObject private var commentviewmodel = CommentViewModel()
    var body: some View {
        VStack{
            let list = commentviewmodel.fetchComments(for: idpost)
            if (list.count == 0)
            {
                Text("NO COMMENTS")
            }else{
                ForEach(list) { list in
                    CommentItemView(nameuser: list.id, datcmt: list.date, content: list.content)
                        .padding(.top)
                }
            }
            HStack{
                TextField("Add a comment", text: $newCommentText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button {
                             
                        } label: {
                               Image(systemName: "paperplane.fill")
                                   .foregroundColor(.white)
                                   .padding(10)
                                   .background(Color.blue.opacity(0.5))
                                   .cornerRadius(50)
                           }
            }
            
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(idpost:"000")
    }
}
