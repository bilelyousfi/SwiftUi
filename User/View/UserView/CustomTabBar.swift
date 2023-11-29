//
//  CustomTabBar.swift
//  User
//
//  Created by Ayachi Zakaria on 26/11/2023.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: String
    
    @State var tabPoints : [CGFloat] = []
    
   /* var body: some View{
        
        
        TabView{
            ProfileView()
                .tabItem{
                    Label("he", image: "person")
                }
            SignUp(showSignup: .constant(false))
                .tabItem{
                    Label("gsf", image: "house")
                }
        }
        
    }*/
    
   var body: some View {
      HStack(spacing: 0){
          TabBarButton(image: "house", selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButton(image: "camera", selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButton(image: "heart", selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButton(image: "person", selectedTab: $selectedTab, tabPoints: $tabPoints)
        }
        .padding()
       .background(Color.blue
            .clipShape(TabCurve(tabPoint: getCurvePoint() - 15))
        )
       .overlay(
            Circle()
                .fill(Color.black)
                .frame(width: 10,height: 10)
                .offset(x: getCurvePoint() - 20)
            ,alignment: .bottomLeading
        )
        .cornerRadius(30)
        .padding(.horizontal)
    }
    func getCurvePoint()->CGFloat{
        if tabPoints.isEmpty {
            return 10
        }else {
            switch selectedTab {
            case "house":
                return tabPoints[0]
            case "camera":
                return tabPoints[1]
            case "heart":
                return tabPoints[2]
           default:
                return tabPoints[3]
            }
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    
    static var previews: some View {
       ContentView()
    }
}

struct TabBarButton: View{
    var image: String
    @Binding var selectedTab: String
@Binding var tabPoints : [CGFloat]
    var body: some View {
        GeometryReader{reader -> AnyView in
            let midX = reader.frame(in: .global).midX
            DispatchQueue.main.async {
                if tabPoints.count <= 4 {
                    tabPoints.append(midX)
                }
            }

           return AnyView (
             Button(action: {
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)){
                        print("Tab avant:\(selectedTab)")
                        selectedTab = image
                        print("Tab apres:\(selectedTab)")
                    }
                }, label: {
                    Image(systemName: "\(image)\(selectedTab == image ? ".fill" : "")")
                        .font(.system(size:25, weight: .semibold))
                        .foregroundColor(Color("TabSelected"))
                       .offset(y: selectedTab == image ? -10 : 0)
               })
                .frame(maxWidth: .infinity, maxHeight: .infinity))
        }
        .frame(height: 50)
    }
    
}
