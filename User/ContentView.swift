//
//  ContentView.swift
//  User
//
//  Created by Ayachi Zakaria on 25/11/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var showSignup: Bool = false
    @State private var isKeyboardshowing: Bool = false
    var body: some View {
        NavigationStack {
            Login(showSignup: $showSignup)
                .navigationDestination(isPresented: $showSignup){
                    SignUp(showSignup: $showSignup)
                
                }
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification), perform: {_ in
                    if !showSignup{
                        isKeyboardshowing = true
                    }
                })
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification), perform: {_ in
                    isKeyboardshowing = false
                })
        }
        .overlay{
            if #available(iOS 17, *){
                CircleView()
                    .animation(.easeInOut(duration: 0.3), value: showSignup)
                    .animation(.easeInOut(duration: 0.3), value: isKeyboardshowing)
            }else{
                CircleView()
                    .animation(.easeInOut(duration: 0.3), value: showSignup)
                    .animation(.easeInOut(duration: 0.3), value: isKeyboardshowing)
            }
           
        }
        
    }
    @ViewBuilder
    func CircleView() -> some View {
        Circle()
            .fill(.linearGradient(colors: [.yellow, .orange, .red], startPoint: .top, endPoint: .bottom))
            .frame(width: 200, height: 200)
            .offset(x: showSignup ? 90 : -90, y: -90 - (isKeyboardshowing ? 200 : 0))
            .blur(radius: 15)
            .hSpacing(showSignup ? .trailing : .leading)
            .vSpacing(.top)
    }
}

  

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
