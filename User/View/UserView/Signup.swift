//
//  Signup.swift
//  User
//
//  Created by Ayachi Zakaria on 25/11/2023.
//

import SwiftUI

struct SignUp: View {
    @Binding var showSignup: Bool
    @State private var Username:String = ""
    @State private var emailID:String = ""
    @State private var password:String = ""
    @State private var confirmPassword:String = ""
    @State private var phone:String = ""
    @State private var showAlert = false
    var body: some View {
       
        VStack(alignment: .leading, spacing: 15, content: {
            // Back Button
            Button(action: {
                showSignup = false
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
       
            Text("SignUp")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 25)
            Text("Please sign up to cntinue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            
            
            VStack(spacing: 25){		
                
                Section("Your Image Please ♡♡"){
                    Image("ImageProfile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                        
                }
                
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Success"),
                        message: Text("Registration was successful."),
                        dismissButton: .default(Text("OK"))
                    )
                }

                //Custom Texy field
                CustomTF(sfIcon: "person", hint: "Username",value: $Username)
                    
                CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
                    .padding(.top, 5)
             
                
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: true,value: $password)
                    .padding(.top, 5)
                
                CustomTF(sfIcon: "lock", hint: "Confirm Password", isPassword: true,value: $confirmPassword)
                    .padding(.top, 5)
                
                CustomTF(sfIcon: "phone", hint: "Phone Number",value: $phone)
                    .padding(.top, 5)
                    .keyboardType(.numberPad)
                
                //login Button
                GradiantButton(title: "Continue", icon: "arrow.right"){
                    let newUser = User(Username: self.Username, email: self.emailID, password: self.password, confirmPassword: self.confirmPassword, phone: self.phone)
                    AuthService.shared.register(user: newUser){result in
                        switch result {
                        case .success(let success):
                            if success{
                                showAlert = true
                                showSignup = false
                            }else{}
                        case .failure(let error):
                            print("Erreur lors de l'enregistrement : \(error.localizedDescription)")

                        }
                    }
                }
                .disableWithOpacity(Username.isEmpty || emailID.isEmpty || password.isEmpty)
            }
            .padding(.top,20)
            Spacer(minLength: 0)
            HStack(spacing: 6 ){
                Text("Already have an account ?")
                    .foregroundStyle(.gray)
                Button("Login"){
                    showSignup = false
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
    }
       
}


struct Signup_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
