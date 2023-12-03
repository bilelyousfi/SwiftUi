//
//  ProductHistory.swift
//  Ecoshop
//
//  Created by MacOS on 29/11/2023.
//

import SwiftUI

struct ProductHistory: View {
    var images  = [
        "eau",
        "randa",
        "flitox",
        "danao",
    ]
    
    let
    
    var body: some View {
        NavigationStack {
            VStack{
            SearchAndFilterBar()
            ScrollView{
                LazyVStack(spacing: 32){
                    ForEach(0 ... 10, id: \.self) { listing in
                        NavigationLink(value: listing){
                            
                            VStack(spacing: 8) {
                                // image
                                Rectangle()
                                    .frame(height: 320)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                // listening details
                                VStack(alignment: .leading){
                                    Text(PurshaceProduct.name)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.black)
                                    Text("12/09/2023")
                                        .foregroundColor(.red)
                                }
                                .font(.footnote)
                            }
                            
                                .frame(height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                      
                    }
                }
                .padding()
            }
            .navigationDestination(for: Int.self) { listing in
                Text("Listing detail view ...")
            }
            }
        }
    }
}

struct ProductHistory_Previews: PreviewProvider {
    static var previews: some View {
        ProductHistory()
    }
}
