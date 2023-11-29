//
//  EditProfile.swift
//  User
//
//  Created by bilel on 27/11/2023.
//

import SwiftUI

struct EditProfile: View {
    
    @State private var Username:String = ""
    @State private var emailID:String = ""
    @State private var phone:String = ""
    
    @Environment(\.dismiss) private var dismiss
    @State private var errorMessage: String?
    @State private var showingAlert = false
    func loadUserDetails() {
        
        AuthService.shared.fetchUserDetails { result in
            DispatchQueue.main.async {
                
                switch result {
                case .success(let userDetails):
                    self.Username = userDetails.Username
                    self.emailID = userDetails.email
                    self.phone = userDetails.phone
                    
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
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
                
                
                Section("Your Image Please ♡♡"){
                    Image("ImageProfile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    
                }
                CustomTF(sfIcon: "person", hint: "Username",value: $Username)
                    
                CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
                    .padding(.top, 5)
                CustomTF(sfIcon: "phone", hint: "Phone Number",value: $phone)
                    .padding(.top, 5)
                   
                
                GradiantButton(title: "Update", icon: "arrow.right"){
                    AuthService.shared.updateUserProfile(Username: self.Username, email: self.emailID, phone: self.phone){ success, error in
                        DispatchQueue.main.async {
                            if(success){
                                self.showingAlert = true
                            }else{
                                
                            }
                            if let error = error {
                                print("Erreur de mise à jour : \(error.localizedDescription)")
                                           }
                           
                        }
                        
                    }
                    
                }.alert(isPresented: $showingAlert) {
                    
                    Alert(
                        title: Text("Succes"),
                        message: Text("You are Successfully Updated"),
                        dismissButton: .default(Text("OK"))
                    )
                }
                .disableWithOpacity(Username.isEmpty || emailID.isEmpty || phone.isEmpty)
                
            }
            .onAppear {
                loadUserDetails()
            }
            .padding(.vertical, 55)
            .padding(.horizontal, 25)
        })
        
      
       
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
    }
}
