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
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var showViews = false
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white2.edgesIgnoringSafeArea(.all)
                VStack(spacing: 25) {
                    Image("LogoDark")
                        .resizable()
                        .frame(width: 100, height: 80)
                        .padding(.top, 20)
                    
                    VStack(alignment: .leading) {
                        Text("Welcome to")
                            .font(.title2)
                        Text("Tulsa Garden Club")
                            .font(.title)
                    }
                    .padding(.bottom, 60)
                    
                    VStack(spacing: 16) {
                        TextField("Email", text: $email)
                            .textInputAutocapitalization(.never)
                            .frame(width: 270)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(errorMessage != nil ? Color.red : Color.mediumgreen.opacity(0.7), lineWidth: 2)
                            )
                            .font(.title2)
                        
                        SecureField("Password", text: $password)
                            .frame(width: 270)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(errorMessage != nil ? Color.red : Color.mediumgreen.opacity(0.7), lineWidth: 2)
                            )
                            .font(.title2)
                    }
                    
                    // Normal login button
                    Button {
                        loginUser()
                        
                    } label: {
                        Text("LOGIN")
                        
                            .frame(width: 100, height: 15)
                            .font(.title2.bold())
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.darkgreen)
                            .cornerRadius(10)
                    }
                    
                    // Error message
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                            .padding(.top, 8)
                    }
                    
                    Spacer()
                }
                .padding()
                
                // Admin button anchored bottom-left
                VStack {
                    Spacer()
                    HStack {
                        Button {
                            skipLoginForAdmin()
                        } label: {
                            HStack {
                                Image(systemName: "lock.circle.dotted")
                                Text("Admin")
                                    .bold()
                            }
                            .padding(10)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(8)
                            .shadow(radius: 4)
                        }
                        Spacer()
                    }
                    .padding(.leading, 20)
                    .padding(.bottom, 20)
                }
            }
            .navigationDestination(isPresented: $showViews) {
                Views()
            }
        }
    }
    
    private func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error != nil {
                errorMessage = "Incorrect email or password"
                return
            }
            errorMessage = nil
            showViews = true
        }
    }
    
    private func skipLoginForAdmin() {
        // Bypass login for testing
        errorMessage = nil
        showViews = true
    }
}

#Preview {
    ContentView()
}

