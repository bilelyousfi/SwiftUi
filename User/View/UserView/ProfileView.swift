//
//  ProfileView.swift
//  User
//
//  Created by Ayachi Zakaria on 26/11/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var isAuthenticated = false
    @State private var Username:String = ""
    @State private var emailID:String = ""
    @State private var phone:String = ")"
    @State private var errorMessage: String?
    @State private var showingEditProfile = false
    @State private var showingChangePassword = false
    func loadUserDetails() {
        isAuthenticated = true
        AuthService.shared.fetchUserDetails { result in
            DispatchQueue.main.async {
                isAuthenticated = false
                switch result {
                case .success(let userDetails):
                    self.Username = userDetails.Username
                    self.emailID = userDetails.email
                    self.phone = userDetails.phone
                    print("EmailID set to: \(self.emailID)")
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    var body: some View {
        List{
            Section("Account")
            {
                HStack{
                    Image("ImageProfile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    VStack(alignment: .leading, spacing: 4){
                        Text(Username)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                       
                        Text(emailID)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
            }
        
            Section("Account Details"){
                HStack {
                    Text("Phone number")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Spacer()
                    Text(phone)
                        .font(.headline)
                }
             
            }
            
            

            
            Section("General") {
                ProfileOptionRow(iconName: "gearshape.fill", optionName: "Edit your Profile") {
                //authenticateUser()
                    self.showingEditProfile = true

                }
                .sheet(isPresented: $showingEditProfile) {
                    EditProfile()
                }
                ProfileOptionRow(iconName: "shield", optionName: "Password and Security") {
                                           // Action for Settings
                    self.showingChangePassword = true
                }
                .sheet(isPresented: $showingChangePassword) {
                   ChangePassword()
                }
                Button{
                    print("delete account ...")
                } label: {
                    SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                }
            }
            Section{
                Button{
                    print("Sign Out ...")
                } label: {
                    SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                }
               
            }
        }
        .onAppear {
        loadUserDetails()
    }

    }
        
     
    
  
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}





struct ProfileOptionRow: View {
    var iconName: String
    var optionName: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: iconName)
                    .foregroundColor(.blue)
                    .imageScale(.large)
                Text(optionName)
                    .foregroundColor(.black)
            }
        }
    }
}
struct DynamicBackgroundView: View {
    var body: some View {
         LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
