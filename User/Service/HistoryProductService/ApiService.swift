// ProductViewModel.swift

import Foundation

class ApiService: ObservableObject {
    @Published var products: [PurshaceProduct] = []

    func fetchData() {
        guard let url = URL(string: "https://192.168.1.101:9090/product") else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([PurshaceProduct].self, from: data)
                    DispatchQueue.main.async {
                        self.products = decodedData
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
}
//ProductViewModel apiService
//product PurshaceProduct
