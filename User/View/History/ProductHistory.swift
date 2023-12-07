//
//  ProductHistory.swift
//  Ecoshop
//
//  Created by MacOS on 29/11/2023.
//

import SwiftUI

struct ProductHistory: View {
    
    @StateObject var productViewModel: ProductViewModel
    @State private var userId = "123" // Ajoutez la variable userId
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchAndFilterBar()
                
                ScrollView {
                    LazyVStack(spacing: 32) {
                        ForEach(productViewModel.histories.indices, id: \.self) { index in
                            let history = productViewModel.histories[index]

                            VStack(spacing: 8) {
                                // Image
                                LoadingImage(url: history.productId.image)
                                    .frame(height: 320)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))

                                // Listing details
                                VStack(alignment: .leading) {
                                    // Product Name
                                    Text(history.productId.name)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.black)

                                    // Date of Purchase
                                    Text("\(history.date, formatter: dateFormatter)")
                                        .foregroundColor(.red)
                                }
                                .font(.footnote)
                            }
                            .frame(height: 400)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    .padding()
                    
                    // on appear
                    .onAppear {
                        if !userId.isEmpty {
                            productViewModel.fetchHistoryProduct(userId: userId)
                        }
                    }
                }
            }
        }
        
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    
}

struct ProductHistory_Previews: PreviewProvider {
    static var previews: some View {
        ProductHistory(productViewModel: ProductViewModel())
    }
}
