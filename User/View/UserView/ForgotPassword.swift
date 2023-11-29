//
//  ForgotPassword.swift
//  User
//
//  Created by Ayachi Zakaria on 25/11/2023.
//

import SwiftUI

struct ForgotPassword: View {
    @Binding var showOtpView: Bool
    @State private var phone:String = ""
    @State private var askOTP: Bool = false
    @State private var otpText: String = ""
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
            .padding(.top, 10)
            
       
            Text("Forgot Password?")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            Text("Please enter your Phone number so that we can send the code.")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            
            
            VStack(spacing: 25){
              
                    
                CustomTF(sfIcon: "phone", hint: "Phone Number", value: $phone)
                    .keyboardType(.numberPad)
                    
               
             
                
                
                
                //login Button
                GradiantButton(title: "Send", icon: "arrow.right"){
                    
                   Task{
                        
                       askOTP.toggle()
                        try? await Task.sleep(for: .seconds(0))
                      
                    }
                    
                    
                    
                }
                .disableWithOpacity( phone.isEmpty)
            }
            .padding(.top,20)
          
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .interactiveDismissDisabled()
        
        .sheet(isPresented: $askOTP, content: {
            if #available(iOS 16.4, *){
                OTPView(otptext: $otpText )
                    .presentationDetents([.height(350)])
                    .cornerRadius(30)
            }else{
                OTPView(otptext: $otpText )
                    .presentationDetents([.height(350)])
            }
        })
    }
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
