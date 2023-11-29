//
//  PasswordResetView.swift
//  User
//
//  Created by Ayachi Zakaria on 25/11/2023.
//

import SwiftUI

struct PasswordResetView: View {
   
    @State private var passwod:String = ""
    @State private var confirmPasswod:String = ""
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            // Back Button
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
       
            Text("Reset Password?")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
        
            
            
            VStack(spacing: 25){
              
                    
                CustomTF(sfIcon: "lock", hint: "Password", value: $passwod)
               
                CustomTF(sfIcon: "lock", hint: "confirmPassword", value: $confirmPasswod)
                    .padding(.top, 5)
                
                
                
                //login Button
                GradiantButton(title: "Send", icon: "arrow.right"){
                 dismiss()
                    
                
                }
                .disableWithOpacity( passwod.isEmpty || confirmPasswod.isEmpty)
            }
            .padding(.top,20)
          
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .interactiveDismissDisabled()
    }
}

struct PasswordResetView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
