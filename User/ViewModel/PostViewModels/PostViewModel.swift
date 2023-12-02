//
//  PostViewModel.swift
//  Ecoshop
//
//  Created by gataga on 2/12/2023.
//

import Foundation

class PostViewModel:ObservableObject{
    @Published var posts : [Post] = []
    private let BaseUrl = "http://172.18.6.149:9090/"
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
    
    
   // init(){
     //   fetchPosts()
    //}
    
    //func fetchPosts(){
      //  servicePost.shared.getPost{ result in
        //    switch result {
          //  case .success(let posts):
            //    DispatchQueue.main.async {
              //  self.posts = posts
                //print("Fetched posts: \(posts)")
                //}
            //case .failure(let error):
              //  print("Failed to fetch posts: \(error.localizedDescription)")
                //}
            //}
            
        //}
   }

