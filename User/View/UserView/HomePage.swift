//
//  HomePage.swift
//  User
//
//  Created by Ayachi Zakaria on 26/11/2023.
//

import SwiftUI

struct HomePage: View {
    
    @State var selectedTab = "house"
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.white
                .ignoresSafeArea()
            
            VStack{
                if selectedTab == "house"{
                    HouseView()
                       // .transition(.move(edge: .bottom))
                }
                if selectedTab == "person"{
                    ProfileView()
                       
                }
                Spacer()
            }
           
            
            
            CustomTabBar(selectedTab: $selectedTab)
                
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
