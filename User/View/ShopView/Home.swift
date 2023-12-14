//
//  Home.swift
//  Ecoshop
//
//  Created by gataga on 13/12/2023.
//

import SwiftUI

struct Home: View {
    
    //Category View Properties
    @State var selectedCategory = "All"
    @StateObject private var shopviewmodel = shopViewModel()
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack {
                    //Header
                    HStack {
                        Text("**EcoShop** Products")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                    }
                    .padding(30)
                    
                    // Category List
                    CategoryListView
                    
                    //Collection View
                    HStack {
                        Text("**Products List**")
                            .font(.system(size: 24))
                        
                        Spacer()

                        NavigationLink {
                            CollectionView ()
                                .environmentObject(cartManager)
                        } label: {
                            Image(systemName: "arrow.right")
                                .imageScale(.large)
                        }
                        .foregroundColor(.black)
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    
                    //Poduct List
                    
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(shopviewmodel.productList, id: \.id) { item in
                                    ProductCard(product: item)
                                        .environmentObject(cartManager)
                            }
                        }
                            .padding(.leading)
                    }
                }
            }
        }
    }
    // Category List View
    var CategoryListView: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                ForEach(categoryList, id: \.id) { item in
                    Button {
                        selectedCategory = item.title
                    } label: {
                        HStack {
                            if item.title != "All" {
                                Image(item.icon)
                                    .foregroundColor(selectedCategory == item.title ? .yellow : .black)
                            }
                            
                            Text(item.title)
                            }
                            .padding(20)
                            .background(selectedCategory == item.title ? .black : .gray.opacity(0.1))
                            .foregroundColor(selectedCategory != item.title ? .black : .white)
                            .clipShape(Capsule())
                        }
                    }
                }
                .padding(.horizontal, 30)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(CartManager())
    }
}

// Product Card View
struct ProductCard: View {
   
    var product: Product
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string:product.image)){ phase in phase.image?
            //Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing, -200)
                .rotationEffect(Angle(degrees: 30))
            }
            ZStack {
                VStack(alignment: .leading, content: {
                    Text("\(product.name)")
                        .font (.system(size: 36, weight: .semibold))
                        .frame(width: 140)
                    
                    Text(product.categorie)
                        .font(.callout)
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    HStack {
                        Text("\(product.price) DT")
                            .font (.system(size: 24, weight: .semibold))
                        
                        Spacer()
                        
                        Button {
                            cartManager.addToCart(product: product)
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 90, height: 68)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, -10)
                        
                    }
                    .padding(.leading)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(.white.opacity(0.9))
                    .clipShape(Capsule())
                })
            }
            .padding(30)
            .frame(width: 336, height: 442)
        }
        .frame(width: 336, height: 442)
        .background(.yellow.opacity(0.13))
        .cornerRadius(40)
        .padding(.leading, 20)
    }
}
