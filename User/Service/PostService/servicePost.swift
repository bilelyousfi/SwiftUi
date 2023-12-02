//
//  servicePost.swift
//  Ecoshop
//
//  Created by gataga on 2/12/2023.
//

import Foundation
class servicePost{
    static let shared = servicePost()
    private let BaseUrl = "http://172.18.6.149:9090"
    
    func getPost(completion:@escaping(Result<[Post], Error>) -> Void){
        guard let url = URL(string: "\(BaseUrl)/posts") else {
                    completion(.failure(NetworkError.invalidURL(url: "\(BaseUrl)/posts")))
                    return
                }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let posts = json["posts"] as? [[String: Any]]{
                    let jsonData = try JSONSerialization.data(withJSONObject: posts, options: .prettyPrinted)
                    let decodedPosts = try JSONDecoder().decode([Post].self, from: jsonData)
                    completion(.success(decodedPosts))
                }else {
                    throw DecodingError.typeMismatch([Post].self, DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array but found a dictionary instead."))
                }
            }catch {
                print("Decoding error: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }
}
enum NetworkError: Error {
    case invalidURL(url: String)
    case noData
}
