//
//  Login.swift
//  User
//
//  Created by Ayachi Zakaria on 25/11/2023.
//

import SwiftUI

struct Login: View {
    @Binding var showSignup: Bool
    @State private var emailID:String = ""
    @State private var password:String = ""
    @State private var showForgotPasswordView:Bool = false
    @State private var showOtpView:Bool = false
    @State private var askOTP: Bool = false
    @State private var otText: String = ""
    @State private var isAuthenticated = false
    @State private var showAlert = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Spacer(minLength: 0)
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text("Please sign in to cntinue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Success"),
                        message: Text("Login was successful."),
                        dismissButton: .default(Text("OK"))
                    )
                }
            
            VStack(spacing: 25){
                //Custom Texy field
                CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
                
                
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: true,value: $password)
                    .padding(.top, 5)
                Button("Forgot Password?"){
                    showForgotPasswordView.toggle()
                }
                .font(.callout)
                .fontWeight(.heavy)
                .tint(.yellow)
                .hSpacing(.trailing)
                
                //login Button
                GradiantButton(title: "Login", icon: "arrow.right"){
                    AuthService.shared.signIn(email: self.emailID, password: self.password){result in
                        DispatchQueue.main.async {
                            switch result {
                            case .success(let token):
                                isAuthenticated = true
                                   
                                print("Logged in successfully, token: \(token)")
                                   
                              
                            case .failure(let error):
                                print("Erreur  : \(error.localizedDescription)")

                            }
                        }
                      
                        
                    }
                    
                }
                .disableWithOpacity(emailID.isEmpty || password.isEmpty)
            }
            .fullScreenCover(isPresented: $isAuthenticated, content: {
                HomePage(isAuthenticated: $isAuthenticated)
            })
            .padding(.top,20)
            Spacer(minLength: 0)
            HStack(spacing: 6 ){
                Text("Don't have an account ?")
                    .foregroundStyle(.gray)
                Button("SignUp"){
                    showSignup.toggle()
                }
                .fontWeight(.bold)
                .tint(.yellow)
            }
            .font(.callout)
            .hSpacing()
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .toolbar(.hidden, for: .navigationBar)
        .sheet(isPresented: $showForgotPasswordView, content: {
            if #available(iOS 16.4, *){
                ForgotPassword(showOtpView: $showOtpView)
                    .presentationDetents([.height(300)])
                    .cornerRadius(30)
            }else{
                ForgotPassword(showOtpView: $showOtpView)
                    .presentationDetents([.height(300)])
            }
        })
        
       
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
