//
//  SearchAndFilterBar.swift
//  Ecoshop
//
//  Created by MacOS on 29/11/2023.
//

import SwiftUI

struct SearchAndFilterBar: View {
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Search Product with")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("All - Favorites - Name")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            } // End VStack
    
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            })
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow( color: .black.opacity(0.4), radius: 2)
        }
        .padding()
    }
}

struct SearchAndFilterBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchAndFilterBar()
    }
}
