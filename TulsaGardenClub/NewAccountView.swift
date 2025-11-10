//
//  NewAccountView.swift
//  TulsaGardenClub
//
//  Created by AM Student on 11/10/25.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct NewAccountView: View {
    
    
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordVerification: String = ""
    
    @State var showContentView = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
      
     
        NavigationView {
            
            NavigationStack {
                ZStack {
                    Color(.white)
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
                            
                            SecureField("Verify Password", text: $passwordVerification, prompt: Text("Verify password..."))
                                .font(.title2)
                                .textFieldStyle(.roundedBorder)
                        }
                        .padding()
                        VStack(spacing: 16) {
                            Button {
                                createNewUser()
                            } label: {
                                Text("Creat Account")
                                    .frame(maxWidth: .infinity)
                                    .font(.title2.bold())
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.green2)
                            .cornerRadius(16)
                        }
                        
                        .padding()
                        
                        Spacer()
                        
                        Button {
                            showContentView.toggle()
                            dismiss()
                        } label: {
                            Text("Already have an account? Login")
                                .frame(maxWidth: .infinity)
                                .font(.title3)
                                .foregroundColor(Color.black)
                        }
                            
                    }
                }
                
                .navigationTitle(Text("Create new account"))
            }
        }
            }
    
    private func createNewUser() {
        if password != passwordVerification {
            
        }
        
        if password.isEmpty {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let err = error {
                print("Error \(err.localizedDescription)")
                return
            }
            
            print("Successfully registered user.")
            
            
                dismiss()
            
        }
    }
    }


#Preview {
    NewAccountView()
}
