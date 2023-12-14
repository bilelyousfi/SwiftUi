//
//  shopviewmodels.swift
//  Ecoshop
//
//  Created by gataga on 14/12/2023.
//



import Foundation

class shopViewModel:ObservableObject{
    @Published var  productList: [Product] = []
    //private let BaseUrl = "http://172.18.6.149:9090/"
    private let BaseUrl = "http://192.168.1.87:9090/"

    init() {
            getProduct()
        }
    func getProduct(){
        if let url = URL(string: "\(BaseUrl)product") {
            URLSession.shared.dataTask(with: url) {
                data, response, error in
                if let data = data {
                    do {
                        let decodedResponse = try JSONDecoder().decode([Product].self, from: data)
                        print("\(decodedResponse)")
                        DispatchQueue.main.async {
                            self.productList = decodedResponse
                            
                        }
                    } catch{
                        print("Erreur de decodage JSON : \(error)")
                    }
                }
            }.resume()
        }
        
    }

    
  
}


