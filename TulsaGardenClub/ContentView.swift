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
//                Color(.blue.opacity(0.1))
//                    .ignoresSafeArea(edges: .all)
                ZStack {
                    
                    Image("TGCLogo")
                        .resizable()
                        
                    
                        .frame(width: 140, height: 120)
                        .position(x: 360, y: -100)
                    Circle()
                        .fill(Color.darkgreen.opacity(0.9))
                        .frame(width: 720, height: 720)
                    Circle()
                        .fill(Color.mediumgreen)
                        .frame(width: 660, height: 660)
                    Circle()
                        .fill(Color.lightgreen)
                        .frame(width: 600, height: 600)
                    
                    
                    
                }
                .position(x: 200, y: 600)
                VStack {
                   
                      
                    
                   
                    VStack(spacing: 20) {
                        TextField("Email", text: $email, prompt: Text("Enter email..."))
                            .frame(width: 270)
                            .padding(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.mediumgreen.opacity(0.7), lineWidth: 3))
                            .font(.title2)
                            .textFieldStyle(.plain)
                        
                            .autocapitalization(.none)
                        SecureField("Password", text: $password, prompt: Text("Enter password..."))
                            .frame(width: 270)
                            .padding(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.mediumgreen.opacity(0.7), lineWidth: 3))
                            .font(.title2)
                            .textFieldStyle(.plain)
                    }
                    .position(x: 185, y: 420)
                    .padding()
                    VStack(spacing: 16) {
                        Button {
                            loginUser()
                        } label: {
                            Text("LOGIN")
                                .frame(width: 240)
                                .font(.title2.bold())
                                .padding()
                                .foregroundColor(.lightgreen)
                                .background(Color.darkgreen)
                                .cornerRadius(10)
                        }
                        .position(x: 185, y: 160)
                       
                        
//                        Button {
//                            
//                            showNewAccount.toggle()
//                        } label: {
//                            Text("Creat Account")
//                                .frame(maxWidth: .infinity)
//                                .font(.title2.bold())
//                                .padding()
//                                .foregroundColor(.white)
//                                .background(Color.red.opacity(0.6))
//                                .cornerRadius(16)
//                            
//                                .navigationDestination(isPresented: $showNewAccount) {
//                                    NewAccountView()
//                                }
//                      
//                        }
                        
                    }
                    
                    .padding()
                    
                    Spacer()
//                    Button {
//                        showResetPassword = true
//                    } label: {
//                        Text("Forgot Password?")
//                            .frame(maxWidth: .infinity)
//                            .font(.title3)
//                            .foregroundColor(Color.black)
//                        
//                            .navigationDestination(isPresented: $showResetPassword) {
//                                ResetPassword()
//                            }
//                    }
                    
                }
          
            }
            
//            .navigationTitle(Text("Login Page"))
            .navigationDestination(isPresented: $showViews) {
                Views()
            }
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

