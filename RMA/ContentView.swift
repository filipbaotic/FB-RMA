//
//  ContentView.swift
//  RMA
//

import SwiftUI
import Firebase

struct ContentView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    
    var body: some View {
        
        if userViewModel.userEmail != "" {
            Home()
        } else {
            content
        }
    }
    
    var content: some View{
        GeometryReader { geometry in
            VStack{
                
                VStack(alignment: .center, spacing: 8) {
                    Image("logo")
                        .frame(width: 91.02442, height: 20)
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .padding(.bottom, 8)
                .frame(width: 393, alignment: .center)
                .foregroundColor(.clear)
                
                //
                
                VStack(alignment: .leading, spacing: 40) {
                    Text("Welcome")
                    .font(.system(size: 32, weight: .medium, design: .rounded))
                      .foregroundColor(Color(red: 0.04, green: 0.04, blue: 0.04))
                      .frame(maxWidth: .infinity, alignment: .leading)
                    
                    //
                    
                    VStack(alignment: .leading, spacing: 16) {
                       
                        // Email
                        VStack(alignment: .leading, spacing: 4) {
                            //
                            Text("E-mail")
                                .font(.system(size: 14.0, weight: .medium))
                                .foregroundColor(Color(red: 0.09, green: 0.12, blue: 0.16))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            //
                            HStack(alignment: .center, spacing: 8) {
                                TextField("Enter your e-mail here", text: $email)
                                    .font(.system(size: 16.0))
                                    .foregroundColor(Color(red: 0.04, green: 0.04, blue: 0.04))
                                  .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color(red: 0.99, green: 0.98, blue: 0.98))
                            .cornerRadius(6)
                            //
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        //Password
                        VStack(alignment: .leading, spacing: 4) {
                            //
                            
                            Text("Password")
                                .font(.system(size: 14.0, weight: .medium))
                                .foregroundColor(Color(red: 0.09, green: 0.12, blue: 0.16))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            //
                            
                            HStack(alignment: .center, spacing: 8) {
                                SecureField("******", text: $password)
                                    .font(.system(size: 16.0))
                                    .foregroundColor(Color(red: 0.04, green: 0.04, blue: 0.04))
                                  .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color(red: 0.99, green: 0.98, blue: 0.98))
                            .cornerRadius(6)
                            
                            //
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(16)
                .frame(maxHeight: .infinity, alignment: .leading)
                
                //
                
                VStack(alignment: .center, spacing: 8) {
                    
                    
                    Button{
                        login()
                    } label: {
                        BlackButton("Login")
                    }.alert(isPresented: $showAlert) {
                        Alert(title: Text("Incorrect E-mail or password"))
                    }
                    
                    Button{
                        register()
                    } label: {
                        Text("I don’t have an account, Register")
                            .font(.system(size: 16.0))
                          .underline()
                          .foregroundColor(Color(red: 0.04, green: 0.04, blue: 0.04))
                          .padding(.all, 12)
                    }
                    
                }
                .padding(16)
                .frame(width: 393, alignment: .top)
                
            }
        .background(Color(red: 0.66, green: 0.74, blue: 0.86))
        }
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in if error != nil{
            showAlert = true
        } else{
            userViewModel.userEmail = email
            email = ""
            password = ""
        } }
    }
        
    func register(){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in if error != nil{
        } }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BlackButton: View {
    let label: String
    
    init(_ label: String) {
            self.label = label
        }
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) { Text(label)
                .font(.system(size: 16.0, weight: .semibold))
                .foregroundColor(Color(red: 0.99, green: 0.98, blue: 0.98))
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 14)
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color(red: 0.04, green: 0.04, blue: 0.04))
        .cornerRadius(6)
    }
}
