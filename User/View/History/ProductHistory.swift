//
//  ProductHistory.swift
//  Ecoshop
//
//  Created by MacOS on 29/11/2023.
//

// ProductHistory.swift
import SwiftUI

struct ProductHistory: View {
    @StateObject var productViewModel: ProductViewModel
    // @State private var userId = "" // Ajoutez la variable userId
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchAndFilterBar()
                
                ScrollView {
                    LazyVStack(spacing: 32) {
                        ForEach(productViewModel.products, id: \._id) { product in
                            NavigationLink(destination: ProductDetails(product: product)) {
                                VStack(spacing: 8) {
                                    // Image
                                    LoadingImage(url: product.image)
                                        .frame(height: 320)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                    VStack(alignment: .leading) {
                                        // Product Name
                                        Text(product.name)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.black)
                                        
                                        // Product code
                                        Text(product.code)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.red)
                                        
                                    }
                                    .font(.footnote)
                                }
                                .frame(height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                    .padding()
                    .onAppear {
                        productViewModel.fetchProducts()
                        
                    }
                }
            }
        }
        
    }
}
    
    struct ProductHistory_Previews: PreviewProvider {
        static var previews: some View {
            ProductHistory(productViewModel: ProductViewModel())
        }
    }
