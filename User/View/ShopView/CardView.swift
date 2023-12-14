//
//  CardView.swift
//  Ecoshop
//
//  Created by gataga on 13/12/2023.
//

import SwiftUI

struct CardView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    HStack {
                        Text("**Cart**")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        }label: {
                            Text("\(cartManager.products.count)")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70,height: 90)
                                .background(.yellow.opacity(0.5))
                                .cornerRadius(30)
                                
                        }
                        .foregroundColor(.black)
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        }label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70,height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                                
                        }
                        .foregroundColor(.black)
                        
                        }
                    .padding(30)
                    
                    //Cart Products
                    VStack (spacing: 20) {
                        ForEach(cartManager.products, id: \.name) { item in
                            CartPoductCard(product: item)
                        }
                    }
                    .padding(.horizontal)
                    
                    //Card Total
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Delivery Fee")
                            Spacer()
                            Text("7 DT")
                                .font(.system(size: 24, weight: .semibold))
                        }
                        
                        Divider()
                        
                        Text("Total Amount")
                            .font(.system(size: 24))
                        
                        Text("\(cartManager.total) DT ")
                            .font(.system(size: 36, weight: .semibold))
                    }
                    .padding(30)
                    .frame(maxWidth: .infinity)
                    .background(.yellow.opacity(0.5))
                    .cornerRadius(30)
                    .padding()
                    
                    //Buttom to make Payement
                    Button {
                        
                    } label: {
                        Text("Make Payment")
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(.yellow.opacity(0.5))
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.black)
                            .clipShape(Capsule())
                            .padding()
                    }
                   
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
            .environmentObject(CartManager())
    }
}

//Cart Poduct View
struct CartPoductCard: View {
     
    var product: Product
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            AsyncImage(url: URL(string:product.image)){ phase in phase.image?
            //Image(product.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 80, height: 80)
                .background(.gray.opacity(0.1))
                .clipShape(Circle())
            }
            VStack(alignment: .leading, content: {
                Text("\(product.name)")
                    .font(.headline)
                
                Text(product.categorie)
                    .font(.callout)
                    .opacity(0.5)
                
            })
            
            Spacer()
            
            Text("\(product.price) DT")
                .padding()
                .background(.yellow.opacity(0.5))
                .clipShape(Capsule())
        }
    }
}
