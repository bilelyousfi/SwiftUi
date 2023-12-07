import Foundation
import Alamofire
import SwiftUI

struct HistoryService {
    
    // get all products
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

    
    // get history By UserId
    func fetchHistoryProduct(userId: String, completion: @escaping(Result<FetchHistoryResponse?, HistoryError>) -> Void) {
        AF.request(ConnectBE.getAllHistory(userId: userId),
                   method: .get,
                   encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { res in
                switch res.result {
                case .success:
                    if let data = res.data {
                        do {
                            let parsedData = try JSONDecoder().decode(FetchHistoryResponse.self, from: data)
                            DispatchQueue.main.async {
                                completion(.success(parsedData))
                            }
                        } catch {
                            print(error)
                            DispatchQueue.main.async {
                                completion(.failure(.parsingError))
                            }
                        }
                    } else {
                        DispatchQueue.main.async {
                            completion(.failure(.emptyData))
                        }
                    }

                case let .failure(err):
                    print(err)
                    DispatchQueue.main.async {
                        completion(.failure(.networkError))
                    }
                }
            }
    }
    
    
    // Add
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

enum HistoryError: Error {
    case parsingError
    case emptyData
    case networkError
}

