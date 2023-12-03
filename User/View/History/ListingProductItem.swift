//
//  ListingProductItem.swift
//  Ecoshop
//
//  Created by MacOS on 29/11/2023.
//

import SwiftUI

struct ListingProductItem: View {
    var images  = [
        "eau",
        "randa",
        "flitox",
        "danao",
    ]
    
    
    var body: some View {
        VStack(spacing: 8) { 
            // image
            Rectangle()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            // listening details
            VStack(alignment: .leading){
                Text("Flitox")
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                Text("12/09/2023")
                    .foregroundColor(.red)
            }
            .font(.footnote)
        }
        
    }
}

struct ListingProductItem_Previews: PreviewProvider {
    static var previews: some View {
        ListingProductItem()
    }
}
