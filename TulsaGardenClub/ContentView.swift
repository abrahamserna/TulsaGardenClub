//
//  ContentView.swift
//  TulsaGardenClub
//
//  Created by AM Student on 9/16/25.
//

//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}

import SwiftUI

import Firebase
import FirebaseAuth

struct ContentView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var showNewAccount = false
    @State var showResetPassword = false
    @State var showViews = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.blue.opacity(0.1))
                    .ignoresSafeArea(edges: .all)
                
                VStack {
                   
                      
                    
                   
                    VStack(spacing: 20) {
                        TextField("Email", text: $email, prompt: Text("Enter email..."))
                            .font(.title2)
                            .textFieldStyle(.roundedBorder)
                            .autocapitalization(.none)
                        
                        SecureField("Password", text: $password, prompt: Text("Enter password..."))
                            .font(.title2)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding()
                    VStack(spacing: 16) {
                        Button {
                            loginUser()
                        } label: {
                            Text("LOGIN")
                                .frame(maxWidth: .infinity)
                                .font(.title2.bold())
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.green2.opacity(0.7))
                                .cornerRadius(16)
                        }
                        .navigationDestination(isPresented: $showViews) {
                            Views()
                        }
                        
                        Button {
                            
                            showNewAccount.toggle()
                        } label: {
                            Text("Creat Account")
                                .frame(maxWidth: .infinity)
                                .font(.title2.bold())
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.red.opacity(0.6))
                                .cornerRadius(16)
                            
                                .navigationDestination(isPresented: $showNewAccount) {
                                    NewAccountView()
                                }
                      
                        }
                        
                    }
                    
                    .padding()
                    
                    Spacer()
                    Button {
                        showResetPassword = true
                    } label: {
                        Text("Forgot Password?")
                            .frame(maxWidth: .infinity)
                            .font(.title3)
                            .foregroundColor(Color.black)
                        
                            .navigationDestination(isPresented: $showResetPassword) {
                                ResetPassword()
                            }
                    }
                    
                }
            }
            
            .navigationTitle(Text("Login Page"))
            
        }
        }
    
    private func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let err = error {
                print("Error: \(err.localizedDescription)")
                return
            }
          print("Logged in")
            
            showViews = true
        }
    }
    }


#Preview {
    ContentView()
}

