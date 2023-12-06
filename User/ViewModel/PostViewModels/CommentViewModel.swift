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
    
    
    
    /*func getCommentsByPost(postID : String, completion: @escaping([Comment]) -> Void ){
     
     if let url = URL(string: "\(BaseUrl)comments/\(postID)") {
     URLSession.shared.dataTask(with: url) {
     data, response, error in if let data = data {
     do{
     let decodedresponse = try JSONDecoder().decode([Comment].self, from: data)
     DispatchQueue.main.async {
     self.Comments = decodedresponse
     completion(decodedresponse)
     
     }
     
     }catch{
     print("Erreur de decodage JSON : \(error)")
     }
     }
     
     }.resume()
     }
     
     
     
     }
     */
    
    func fetchComment(for postId : String) -> [Comment] {
        guard let url = URL(string: "\(BaseUrl)comments/\(postId)")else{
            fatalError("invalid api url")
        }
        let task = URLSession.shared.dataTask(with: url) {
            data,response,error in
            if let error = error {
                print("error:\(error.localizedDescription)")
                return
            }
            
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("invalid response")
                return
            }
            print("http status code :\(httpResponse.statusCode)")
            
            if let responsedata = data {
                do {
                    let decoder = JSONDecoder()
                    let comments = try decoder.decode([Comment].self, from: responsedata)
                    DispatchQueue.main.async {
                        self.Comments = comments
                    }
                } 
                   catch {
                        print(" error decoding json :\(error.localizedDescription)")
                        if let responseString = String(data:responsedata,encoding: .utf8){
                            print("response string :\(responseString)")
                        }
                    }
                
            }else {
                print("response data is empty or nil")
            }
            
        }
        task.resume()
        return Comments
    }
    
    
}
