//
//  CollectionView.swift
//  Ecoshop
//
//  Created by Badis Aloui on 6/12/2023.
//

import SwiftUI

struct CollectionView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    HStack {
                        Text("**EcoShop** Products")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        }label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70,height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.14))
                        }
                        .foregroundColor(.black)
                    }
                    .padding(30)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())],
                              content: {
                        ForEach(productList, id: \.id) { item in
                            SmallProductCard(product : item)
                                .environmentObject(cartManager)
                        }
                    })
                    .padding(.horizontal)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
            .environmentObject(CartManager())
    }
}

//Small Product Card
struct SmallProductCard: View {
    var product: Product
    
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        ZStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing, -200)
                .rotationEffect(Angle(degrees: 30))

            ZStack {
                VStack(alignment: .leading, content: {
                    Text(product.name)
                        .font(.system(size: 18, weight: .semibold))
                        .frame(width: 70)

                    Text(product.category)
                        .font(.system(size: 10))
                        .padding()
                        .background(.white.opacity(0.5))
                        

                    Spacer()

                    HStack {
                        Text("\(product.price) DT")
                            .font(.system(size: 14, weight: .semibold))
                        
                        Spacer()
                        
                        Button {
                            cartManager.addToCart(product: product)
                            
                        } label: {
                            Image(systemName: "basket")
                .imageScale(.large)
                .frame(width: 45, height: 40)
                .background(.black)
                .clipShape(Capsule())
                .foregroundColor(.white)
                        }
                    }
                    .padding(.trailing, -12)
                    .padding()
                    .frame(maxWidth: .infinity)
                        .background(.white.opacity(0.9))
                        .clipShape(Capsule())
                })
            }
            .padding(20)
            .frame(width: 170, height: 215)
        }
        .frame(width: 170 , height:215)
        .background(product.color.opacity(0.13))
        .cornerRadius(40)
        .padding(.leading,10)
    }
}

