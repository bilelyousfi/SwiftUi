//
//  CommentsView.swift
//  Ecoshop
//
//  Created by gataga on 9/12/2023.
//

import SwiftUI
import Alamofire

struct CommentsView: View {
    let idpost:String
    @State var newCommentText : String = ""
    @StateObject private var commentviewmodel = CommentViewModel()
    @State private var iduser: String="6553fe22539c1e3985881aa2"

    var body: some View {
        VStack{
            let list = commentviewmodel.fetchComments(for: idpost)
            if (list.count == 0)
            {
                Text("NO COMMENTS")
            }else{
                ForEach(list, id:\.id) { list in
                    CommentItemView(nameuser: "abuobaida", datcmt: list.date, content: list.content)
                        .padding(.top)
                }
            }
            HStack{
                TextField("Add a comment", text: $newCommentText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button {
                         addComment()
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
    
    func addComment() {
        guard !newCommentText.isEmpty else {
            // Vérifiez que les identifiants et le texte du commentaire ne sont pas vides
            return
        }

        let commentEndpoint = "http://192.168.1.87:9090/comments/\(idpost)/\(iduser)"

        let parameters: [String: Any] = [
            "content": newCommentText
        ]

        AF.request(commentEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: Comment.self) { response in
                switch response.result {
                case .success(let newComment):
                    // Vous pouvez traiter le nouveau commentaire ici
                    print("Commentaire ajouté avec succès : \(newComment)")
                case .failure(let error):
                    print("Erreur lors de l'ajout du commentaire : \(error)")
                }
            }
    }
}



struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(idpost:"000")
    }
}
