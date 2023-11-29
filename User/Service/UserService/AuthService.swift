//
//  AuthService.swift
//  User
//
//  Created by Ayachi Zakaria on 26/11/2023.
//

import Foundation
class AuthService {
    static let shared = AuthService()
    let baseUrl = "http://localhost:3000/"
    
    
    private init() {}
    
    func register(user: User, completion: @escaping (Result<Bool, Error>) -> Void) {
        let endpoint = "\(baseUrl)user/signup"
        guard let url = URL(string: endpoint) else {
            completion(.failure(NSError(domain: "AuthService", code: 1, userInfo: [NSLocalizedDescriptionKey: "URL invalide"])))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let userData = try JSONEncoder().encode(user)
            request.httpBody = userData
        } catch let error {
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
                DispatchQueue.main.async {
                    completion(.failure(NSError(domain: "AuthService", code: statusCode, userInfo: [NSLocalizedDescriptionKey: "Réponse du serveur non valide"])))
                }
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(true))
            }
            
            
        }.resume()
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        let endpoint = "\(baseUrl)user/login"
        guard let url = URL(string: endpoint) else {
            completion(.failure(NSError(domain: "AuthService", code: 1, userInfo: [NSLocalizedDescriptionKey: "URL invalide"])))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let parameters: [String: Any] = [
            "email": email,
            "password": password,
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            guard let mimeType = httpResponse.mimeType, mimeType == "application/json",
                  let data = data else {
                completion(.failure(URLError(.cannotParseResponse)))
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let token = json["token"] as? String {  // Make sure this key matches what your API sends
                    UserDefaults.standard.set(token, forKey: "tokenAuth")
                    completion(.success(token))
                } else {
                    completion(.failure(URLError(.cannotParseResponse)))
                }
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
    
    func fetchUserDetails(completion: @escaping (Result<UserDetails, Error>) -> Void) {

        let endpoint = "\(baseUrl)user/profile"
        guard let url = URL(string: endpoint) else {
            completion(.failure(NSError(domain: "AuthService", code: 1, userInfo: [NSLocalizedDescriptionKey: "URL invalide"])))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        if let accessToken = UserDefaults.standard.string(forKey: "tokenAuth") {
            request.addValue("\(accessToken)", forHTTPHeaderField: "Authorization")
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data else {
                 completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])))
                return
            }
//            print(httpResponse)
            // Ajouter cette ligne pour imprimer les données brutes
               if let jsonString = String(data: data, encoding: .utf8) {
                   print("Réponse JSON brute: \(jsonString)")
               }
            do {
                       let userDetails = try JSONDecoder().decode(UserDetails.self, from: data)
                        print(userDetails)
                       completion(.success(userDetails))
                   } catch {
                       completion(.failure(error))
                   }
               }.resume()
           }
    
    
    func updateUserProfile(Username: String, email: String, phone: String, completion: @escaping (Bool, Error?) -> Void) {
        let endpoint = "\(baseUrl)user/updateuser" // Assurez-vous que cette route correspond à votre backend
             guard let url = URL(string: endpoint) else {
                 completion(false, NSError(domain: "AuthService", code: 1, userInfo: [NSLocalizedDescriptionKey: "URL invalide"]))
                 return
             }

             var request = URLRequest(url: url)
             request.httpMethod = "PUT"
             request.addValue("application/json", forHTTPHeaderField: "Content-Type")

             let body: [String: Any] = [
                 "Username": Username,
                 "email": email,
                 "phone": phone
             ]

             request.httpBody = try? JSONSerialization.data(withJSONObject: body)

             // Ajoutez le token d'authentification à l'en-tête de la requête
             if let accessToken = UserDefaults.standard.string(forKey: "tokenAuth") {
                 request.addValue("\(accessToken)", forHTTPHeaderField: "Authorization") // Assurez-vous que le format est correct
             }

             URLSession.shared.dataTask(with: request) { data, response, error in
                 if let error = error {
                     DispatchQueue.main.async {
                         completion(false, error)
                     }
                     return
                 }

                 guard let httpResponse = response as? HTTPURLResponse else {
                     DispatchQueue.main.async {
                         completion(false, NSError(domain: "AuthService", code: 2, userInfo: [NSLocalizedDescriptionKey: "Pas de réponse du serveur"]))
                     }
                     return
                 }

                 if httpResponse.statusCode == 200 {
                     DispatchQueue.main.async {
                         completion(true, nil)
                     }
                 } else {
                     DispatchQueue.main.async {
                         completion(false, NSError(domain: "AuthService", code: 3, userInfo: [NSLocalizedDescriptionKey: "Échec de la mise à jour avec le code de statut \(httpResponse.statusCode)"]))
                     }
                 }
             }.resume()
         }

}
