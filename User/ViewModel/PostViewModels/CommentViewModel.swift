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
    

    
    
    /*func fetchComment(for postId : String) -> [Comment] {
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
    }*/
    
    
    
    
    
    func fetchComments(for postId: String) -> [Comment]  {
            guard let url = URL(string: "\(BaseUrl)comments/\(postId)") else {
                fatalError("Invalid API URL")
            }

            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Request error: \(error.localizedDescription)")
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse else {
                    print("Invalid response")
                    return
                }

                print("HTTP Status Code: \(httpResponse.statusCode)")

                if let responseData = data {
                    do {
                        let decoder = JSONDecoder()
                        let comments = try decoder.decode([Comment].self, from: responseData)

                        DispatchQueue.main.async {
                            self.Comments = comments
                        }
                    } catch {
                        do {
                            let decoder = JSONDecoder()
                            let comment = try decoder.decode(Comment.self, from: responseData)
                            // Handle the case where a single comment is returned
                            DispatchQueue.main.async {
                                self.Comments = [comment]
                            }
                        } catch {
                            print("Error decoding JSON: \(error.localizedDescription)")
                            // Print the response string to help debug
                            if let responseString = String(data: responseData, encoding: .utf8) {
                                print("Response String: \(responseString)")
                            }
                        }
                    }
                } else {
                    print("Response data is empty or nil.")
                }
            }

            task.resume()
        return self.Comments
        }
    

    
}
