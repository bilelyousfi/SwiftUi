//
//  ProductDetails.swift
//  Ecoshop
//
//  Created by MacOS on 29/11/2023.
//

import SwiftUI

struct ProductDetails: View {
    
    let product: PurshaceProduct
    
    var body: some View {
        ScrollView {
            // Image
            LoadingImage(url: product.image)
                .frame(height: 320)
            
            VStack(alignment: .leading, spacing: 8) {
                // Product Name
                Text(product.name)
                    .font(.title)
                    .fontWeight(.semibold)
                
                Divider()
                
                // Product Description
                VStack(alignment: .leading) {
                    Text("Description : ")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                        .foregroundColor(.red)
                    
                    Spacer()
                    
                    Text(product.description)
                }
                
                Divider()
                
                // Carbon Footer
                VStack(alignment: .leading) {
                    Text("Carbon Footer : ")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                        .foregroundColor(.red)
                    
                    Spacer()
                    
                    Text(product.carbonFootPrint)
                }
                
                Divider()
                
                // Water Consumption
                VStack(alignment: .leading) {
                    Text("Water Consumption : ")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                        .foregroundColor(.red)
                    
                    Spacer()
                    
                    Text(product.waterConsumption)
                }
                
                Divider()
                
                // Recyclability
                VStack(alignment: .leading) {
                    Text("Recyclability : ")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                        .foregroundColor(.red)
                    
                    Spacer()
                    
                    Text(product.recyclability)
                }
            }
            .padding()
        }
    }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails(product: PurshaceProduct(
            _id: "1",
            name: "Sample Product",
            description: "Sample Description",
            image: "sample_image_url",
            code: "123",
            carbonFootPrint: "250 KG",
            waterConsumption: "0 L",
            recyclability: "Non recyclable"
        ))
    }
}
