//
//  ProductViewModel.swift
//  Ecoshop
//
//  Created by MacOS on 3/12/2023.
//

import Foundation
import SwiftUI
import Alamofire

class ProductViewModel: ObservableObject {
    
    @Published var products: [PurshaceProduct] = []
    
    @Published var isLoading = true
    
    @Published var history: [History] = []
    
    @Published var date: [Date] = []
    
    func fetchProducts() {
        HistoryService().fetchProducts(){ result in
                switch result {
                    
                case.success(let data):
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                        if data?.statusCode == 200 {
                            self.isLoading = false
                            self.products = data?.products ?? []
                        }
                    }
                    
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    
    
    func fetchHistoryProduct(userId: String) {
             HistoryService().fetchHistoryProduct(userId: userId) { result in
                 switch result {
                 case .success(let data):
                     DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                         if data?.statusCode == 200 {
                             self.isLoading = false
                             self.history = data?.history ?? []
                             self.date = self.history.flatMap { $0.date }
                         }
                     }
                     
                 case.failure(let error):
                     print(error.localizedDescription)
                 }
             }
         }

    
    
    func addProductToHistory(userId: String, productId: String, date: [Date]) {
        HistoryService().addProductToHistory(userId: userId, productId: productId, date: date){ result in
                    switch result {
                        case .success(let data):
                        print("Product added to your history successfully, \(String(describing: data))")
                        case .failure(let error):
                            print(error)
                    }
        }
    }
   

}
