import Foundation
import SwiftUI

class ProductViewModel: ObservableObject {
    
    @Published var products: [PurshaceProduct] = []
    @Published var isLoading = true
    @Published var histories: [History] = []
    @Published var date: [Date] = []
    
    private let historyService: HistoryService
    
    init(historyService: HistoryService = HistoryService()) {
        self.historyService = historyService
    }
    
    
    // get all products
    func fetchProducts() {
        historyService.fetchProducts(){ result in
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
    
    
    
    // get all history by userID
    func fetchHistoryProduct(userId: String) {
        historyService.fetchHistoryProduct(userId: userId) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if data?.statusCode == 200 {
                        self.isLoading = false
                        self.histories = data?.histories ?? []
                        self.date = self.histories.flatMap { $0.date }
                    }
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    // add to history
    func addProductToHistory(userId: String, productId: String, date: [Date]) {
        historyService.addProductToHistory(userId: userId, productId: productId, date: date){ result in
                        switch result {
                            case .success(let data):
                            print("Product added to your history successfully, \(String(describing: data))")
                            case .failure(let error):
                                print(error)
                        }
            }
        }
    
    
}

