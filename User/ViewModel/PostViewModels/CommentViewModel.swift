//
//  CommentViewModel.swift
//  Ecoshop
//
//  Created by gataga on 2/12/2023.
//

import Foundation

class CommentViewModel:ObservableObject{
    @Published  var Comments : [Comment] = []
    
    private var BaseUrl = "http://172.18.6.149:9090/"
   
    
    
     func getCommentsByPost(postID : String) -> [Comment] {
         var list : [Comment] = []
        print("function geeettt commmenttt")
        if let url = URL(string: "\(BaseUrl)comments/\(postID)") {
            URLSession.shared.dataTask(with: url) {
                data, response, error in if let data = data {
                    do{
                        let decodedresponse = try JSONDecoder().decode([Comment].self, from: data)
                        DispatchQueue.main.async {
                            list = decodedresponse
                            print("list : \(list)")
                        }
                        
                    }catch{
                        print("Erreur de decodage JSON : \(error)")
                    }
                }
                
            }.resume()
        }
         print("les commmentaires : \(list)")
         return list
       
    }
    
}
