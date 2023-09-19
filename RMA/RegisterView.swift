//
//  RegisterView.swift
//  RMA
//

import SwiftUI
import Firebase

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLogged = false
    
    var body: some View {
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
                                TextField("johndoe@gmail.com", text: $email)
                                    .font(.system(size: 16.0))
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
                
                HStack(alignment: .center, spacing: 8) {
                    
                    Button{
                        register()
                    } label: {
                        BlackButton("Register")
                    }
                    
                    Button{
                        login()
                    } label: {
                        BlackButton("Login")
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
            print(error!.localizedDescription)
        } }
    }
        
    func register(){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in if error != nil{
            print(error!.localizedDescription)
        } }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
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
