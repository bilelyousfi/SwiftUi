//
//  HistoryService.swift
//  Ecoshop
//
//  Created by MacOS on 29/11/2023.
//

import Foundation
import Alamofire
import SwiftUI

struct HistoryService {
    
    func fetchProducts(completion: @escaping(Result<fetchPurshaceProductResponse?, Error>) -> Void) {
            AF.request("\(ConnectBE.fetchProductUrl)",
                       method: .get,
                       encoding: JSONEncoding.default)
            .validate(contentType: ["application/json"])
            .responseData { res in
                switch res.result {
                    
                case .success:
                    let responseData = Data(res.data!)
                    print(responseData)
                    do {
                        let parsedData = try JSONDecoder().decode(fetchPurshaceProductResponse.self, from: responseData)
                        completion(.success(parsedData))
                        // backend output
                        print(parsedData.products)
                    } catch {
                        print(error)
                        completion(.failure(error))
                    }
                    
                case let .failure(err):
                    debugPrint(err)
                    completion(.failure(err))
                }
            }
    }
    
    
    
    
    func fetchHistoryProduct(userId: String, completion: @escaping(Result<FetchHistoryResponse?, Error>) -> Void) {
              AF.request(ConnectBE.getAllHistory(userId: userId),
                         method: .get,
                         encoding: JSONEncoding.default)
                  .validate(contentType: ["application/json"])
                  .responseData { res in
                      switch res.result {
                          
                      case .success:
                          let responseData = Data(res.data!)
                          print(responseData)
                          do {
                              let parsedData = try JSONDecoder().decode(FetchHistoryResponse.self, from: responseData)
                              print(parsedData)
                              completion(.success(parsedData))
                              print(parsedData.history)
                          } catch {
                              print(error)
                              completion(.failure(error))
                          }
                          
                      case let .failure(err):
                          debugPrint(err)
                          completion(.failure(err))
                      }
                  }
        }
    
    
    
    
    func addProductToHistory(userId: String, productId: String, date: [Date], completion: @escaping (Result<History?, Error>) -> Void) {
            let parameters: [String: Any] = [
                "userId": userId,
                "productId": productId,
                "date": date
            ]

        AF.request(ConnectBE.addToHistory(userId: userId),
                       method: .post,
                       parameters: parameters,
                       encoding: JSONEncoding.default)
                .validate(contentType: ["application/json"])
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        do {
                            let parsedData = try JSONDecoder().decode(History.self, from: data)
                            completion(.success(parsedData))
                        } catch {
                            print(error)
                            completion(.failure(error))
                        }
                    case .failure(let error):
                        debugPrint(error)
                        completion(.failure(error))
                    }
                }
        }
    
    
    
}
