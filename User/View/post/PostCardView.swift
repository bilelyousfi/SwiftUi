//
//  PostCardView.swift
//  Ecoshop
//
//  Created by gataga on 9/12/2023.
//
//@ . [© - = _ \  / "" ' ' ! ? { }

import SwiftUI
import Alamofire
struct PostCardView: View {
      @State var author : String
      @State var content : String
      @State var id : String
      @State var datepub : String
    @State var likes : [String]
      @State var imagepost : String
    @State private var isbuttonlike = false
    // @State private var isbuttondeslike = false
    @State private var iduser: String="6553fe22539c1e3985881aa2"
    @StateObject private var postviewmodel = PostViewModel()

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
                AsyncImage(url: URL(string: imagepost)){ phase in phase.image?

                             //Image(imagepost)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .roundedCorner(20, corners: [.bottomLeft, .topRight, .bottomRight])
                              }
                        HStack {
                            HStack(spacing: 3) {
                                
                                Button {
                                addlike(idpost: id, iduser: iduser)
                                }
                            label: {
                                    if isbuttonlike {
                                    Image(systemName: "heart.fill")
                                     .foregroundColor(.red)
                                        } else {
                                        Image(systemName: "heart")
                                    .foregroundColor(.gray)
                                        }
                                    }
                                if isbuttonlike {
                                    let ciunt = likes.count + 1
                                    Text("\(ciunt.formatted())")}else{
                                        Text("\(likes.count.formatted())")
                                    }
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
    
    func addlike(idpost:String,iduser:String){
      

        let likeEndpoint = "http://192.168.1.87:9090/posts/addlike/\(idpost)/\(iduser)"
        AF.request(likeEndpoint, method: .put)
            .validate()
            .responseDecodable(of: Post.self) { response in
                switch response.result {
                case .success(let like):
                    // Vous pouvez traiter le nouveau commentaire ici
                    print("LIKE ajouté avec succès : \(like)")
                    isbuttonlike = true
                case .failure(let error):
                    print("Erreur lors de l'ajout du LIKE : \(error)")
                }
            }
    }
    
}


struct PostCardView_Previews: PreviewProvider {
    static var previews: some View {
        PostCardView(author: "hassen",  content: "ffffff", id: "000", datepub: "01/01/2023", likes:[],imagepost: "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg")
    }
}
