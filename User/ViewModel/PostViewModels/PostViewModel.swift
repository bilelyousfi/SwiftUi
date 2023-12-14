//
//  PostViewModel.swift
//  Ecoshop
//
//  Created by gataga on 2/12/2023.
//

import Foundation
import Alamofire
class PostViewModel:ObservableObject{
    @Published var posts : [Post] = []
    @Published var userpost = UserPost()
    //private let BaseUrl = "http://172.18.6.149:9090/"
    private let BaseUrl = "http://192.168.1.87:9090/"

    init() {
            getPosts() 
        }
    func getPosts(){
        if let url = URL(string: "\(BaseUrl)posts") {
            URLSession.shared.dataTask(with: url) {
                data, response, error in
                if let data = data {
                    do {
                        let decodedResponse = try JSONDecoder().decode([Post].self, from: data)
                        print("\(decodedResponse)")
                        DispatchQueue.main.async {
                            self.posts = decodedResponse
                            
                        }
                    } catch{
                        print("Erreur de decodage JSON : \(error)")
                    }
                }
            }.resume()
        }
        
    }
    
    
   /* func addlike(idpost:String,iduser:String,islike:Bool){
      

        let likeEndpoint = "\(BaseUrl)/posts/addlike/\(idpost)/\(iduser)"
        AF.request(likeEndpoint, method: .put, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: Post.self) { response in
                switch response.result {
                case .success(let like):
                    // Vous pouvez traiter le nouveau commentaire ici
                    print("LIKE ajouté avec succès : \(like)")
                    islike = true
                case .failure(let error):
                    print("Erreur lors de l'ajout du LIKE : \(error)")
                }
            }
    }*/
}

