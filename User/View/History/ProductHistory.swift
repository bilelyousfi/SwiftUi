//
//  ProductHistory.swift
//  Ecoshop
//
//  Created by MacOS on 29/11/2023.
//

import SwiftUI

struct ProductHistory: View {
    
    @State private var favoriteProducts: Set<String> = []
    
    // Replace productViewModel with a static array of products
    let staticProducts: [PurshaceProduct] = [
        PurshaceProduct(_id: "1", name: "Danao", description: "Description 1", image: "image1", code: "12396325", carbonFootPrint: "250 KG", waterConsumption: "66 L", recyclability: "Recyclable"),
        PurshaceProduct(_id: "2", name: "Eau", description: "Description 2", image: "image2", code: "45612358", carbonFootPrint: "300 KG", waterConsumption: "250 L", recyclability: "Non recyclable"),
        PurshaceProduct(_id: "3", name: "Papier", description: "Description 3", image: "image3", code: "78935246", carbonFootPrint: "200 KG", waterConsumption: "36 L", recyclability: "Non recyclable"),
        PurshaceProduct(_id: "4", name: "Flitox", description: "Description 4", image: "image4", code: "69123456", carbonFootPrint: "30 KG", waterConsumption: "29 L", recyclability: "Recyclable"),
        PurshaceProduct(_id: "5", name: "Detox", description: "Description 5", image: "image5", code: "00216893", carbonFootPrint: "50 KG", waterConsumption: "50 L", recyclability: "Recyclable"),
        PurshaceProduct(_id: "6", name: "Product 6", description: "Description 6", image: "image6", code: "74902364", carbonFootPrint: "550 KG", waterConsumption: "6 L", recyclability: "Recyclable"),
        PurshaceProduct(_id: "7", name: "Product 7", description: "Description 7", image: "image7", code: "56036975", carbonFootPrint: "2 KG", waterConsumption: "77 L", recyclability: "Recyclable"),
    ]


    var body: some View {
            NavigationStack {
                VStack {
                    SearchAndFilterBar()

                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(staticProducts, id: \._id) { product in
                                NavigationLink(destination: ProductDetails(product: product)) {
                                    HStack(spacing: 16) {
                                        // Image
                                        LoadingImage(url: product.image)
                                            .frame(width: 80, height: 80)
                                            .clipShape(RoundedRectangle(cornerRadius: 16))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 16)
                                                    .stroke(Color.gray, lineWidth: 1)
                                            )
                                            .animation(.easeInOut(duration: 0.5))

                                        VStack(alignment: .leading, spacing: 8) {
                                            // Product Name
                                            Text(product.name)
                                                .font(.headline)
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.black)
                                                .animation(.easeInOut(duration: 0.5))

                                            // Product code
                                            Text("Code: \(product.code)")
                                                .font(.subheadline)
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.red)
                                                .animation(.easeInOut(duration: 0.5))
                                        }
                                        .padding(.trailing, 16)

                                        Spacer()

                                        Button(action: {
                                            toggleFavorite(product._id)
                                        }) {
                                            Image(systemName: favoriteProducts.contains(product._id) ? "heart.fill" : "heart")
                                                .foregroundColor(favoriteProducts.contains(product._id) ? .green : .gray)
                                                .imageScale(.large)
                                                .animation(.easeInOut(duration: 0.5))
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white)
                                    .cornerRadius(16)
                                    .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
                                    .animation(.easeInOut(duration: 0.5))
                                }
                            }
                        }
                        .padding()
                    }
                }
                .background(Color(.systemGroupedBackground).ignoresSafeArea())
                .navigationTitle("Product History")
            }
        }

        private func toggleFavorite(_ productId: String) {
            if favoriteProducts.contains(productId) {
                favoriteProducts.remove(productId)
            } else {
                favoriteProducts.insert(productId)
            }
        }
    }

    struct ProductHistory_Previews: PreviewProvider {
        static var previews: some View {
            ProductHistory()
        }
    }
