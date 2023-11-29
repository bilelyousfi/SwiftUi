//
//  ChangePassword.swift
//  User
//
//  Created by Ayachi Zakaria on 27/11/2023.
//

import SwiftUI

struct ChangePassword: View {
    @State private var CurrentPassword:String = ""
    @State private var password:String = ""
    @State private var confirmPassword:String = ""
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15, content: {
            // Back Button
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.leading, 25)
            
            VStack( spacing: 25){
                
                
               
                CustomTF(sfIcon: "lock", hint: "Current Password", isPassword: true,value: $CurrentPassword)
                    
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: true,value: $password)
                    .padding(.top, 5)
                CustomTF(sfIcon: "lock", hint: "Confirm Password", isPassword: true,value: $confirmPassword)
                    .padding(.top, 5)
                
                GradiantButton(title: "Change", icon: "arrow.right"){
                    
                }.disableWithOpacity(CurrentPassword.isEmpty || password.isEmpty || confirmPassword.isEmpty)
                
            }
            .padding(.vertical, 55)
            .padding(.horizontal, 25)
        })
        
      
    }
}

struct ChangePassword_Previews: PreviewProvider {
    static var previews: some View {
        ChangePassword()
    }
}
