//
//  HouseView.swift
//  Ecoshop
//
//  Created by hassen gataga on 30/11/2023.
//

import SwiftUI

struct HouseView: View {
    var body: some View {
        NavigationView {
                   ScrollView {
                       
                       PostListView() // Display the list of posts
                   }
                   .navigationTitle("POSTS") // Set the navigation title
                   .navigationBarItems( trailing: NavigationLink(destination: AddPost(), label:{Image(systemName: "plus.circle")} ) ) // Add leading and trailing navigation bar items
               }
        
        
    }
}

struct HouseView_Previews: PreviewProvider {
    static var previews: some View {
        HouseView()
    }
}
