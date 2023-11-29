//
//  OTPView.swift
//  User
//
//  Created by Ayachi Zakaria on 25/11/2023.
//

import SwiftUI

struct OTPView: View {
    @Binding var otptext: String
    
    @State private var showResetView:Bool = false
    
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
            .padding(.top, 15)
       
            Text("Enter OTP")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            Text("An 6 digit code has been sent to your Phone Number")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            
            
            VStack(spacing: 25){
              
                    OTPVerificationView(otpText: $otptext)
                
                
                
                //login Button
                GradiantButton(title: "Send", icon: "arrow.right"){
               showResetView = true
                    
                }
                .disableWithOpacity( otptext.isEmpty)
            }
            .padding(.top,20)
            
            Spacer(minLength: 0)
          
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .interactiveDismissDisabled()
        
         .sheet(isPresented: $showResetView, content: {
             if #available(iOS 16.4, *){
                 PasswordResetView()
                     .presentationDetents([.height(350)])
                     .cornerRadius(30)
             }else{
                 PasswordResetView()
                     .presentationDetents([.height(350)])
             }
         })
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
