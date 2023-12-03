//
//  ProductDetails.swift
//  Ecoshop
//
//  Created by MacOS on 29/11/2023.
//

import SwiftUI

struct ProductDetails: View {
    var body: some View {
        ScrollView{
            // image
            Rectangle()
                .frame(height: 320)
                
            VStack (alignment: .leading, spacing: 8){
                Text("Flitox")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Divider()
                
                VStack(alignment: .leading){
                Text("Description : ")
                    .font(.headline)
                    .frame(width: 250, alignment: .leading)
                    
                Spacer()
                
                Text("Flitox est un groupe de punk hardcore français, originaire d'Emerainville, en Seine-et-Marne. Formé en 1986, il se séparera trois ans plus tard après avoir sortis un EP et deux albums")
                }
                
                Divider()
                
                VStack(alignment: .leading){
                Text("Carbon Footer : ")
                    .font(.headline)
                    .frame(width: 250, alignment: .leading)
                    
                Spacer()
                
                Text("250 KG")
                }
                
                Divider()
                
                VStack(alignment: .leading){
                Text("Water Consumption : ")
                    .font(.headline)
                    .frame(width: 250, alignment: .leading)
                    
                Spacer()
                
                Text("0 L")
                }
                
                Divider()
                
                VStack(alignment: .leading){
                Text("Recyclability : ")
                    .font(.headline)
                    .frame(width: 250, alignment: .leading)
                    
                Spacer()
                
                Text("Non recyclable")
                }
            }
        }
    }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails()
    }
}
