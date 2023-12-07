//
//  ProductDetails.swift
//  Ecoshop
//
//  Created by MacOS on 29/11/2023.
//

import SwiftUI

struct ProductDetails: View {
    
    @Environment(\.presentationMode) var presentationMode
    let product: PurshaceProduct
    
    var body: some View {
        ScrollView {
            VStack {
                // Image
                LoadingImage(url: product.image)
                    .frame(height: 320)
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    
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
                        Text("Carbon Footprint : ")
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
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(product.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    // Action pour revenir à la page précédente
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                }
            }
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
