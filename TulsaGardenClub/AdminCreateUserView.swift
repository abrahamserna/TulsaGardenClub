//
//  AdminCreateUserView.swift
//  TulsaGardenClub
//
//  Created by AM Student on 12/15/25.
//

import FirebaseFunctions
import SwiftUI


struct CreateUserView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var message: String?

    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter Email", text: $email)
                .textInputAutocapitalization(.never)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
            
            SecureField("Enter Password", text: $password)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
            
            Button("Create Account") {
                Task {
                    await createUserAndSendEmail(email: email, password: password)
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            if let message = message {
                Text(message)
                    .foregroundColor(.green)
                    .padding()
            }
        }
        .padding()
    }
    
    private func createUserAndSendEmail(email: String, password: String) async {
        guard let url = URL(string: "https://YOUR_PROJECT.supabase.co/functions/v1/send-welcome-email") else {
            message = "Invalid function URL"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer YOUR_ANON_KEY", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: String] = ["email": email, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        do {
            let (_, response) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                message = "Account created successfully. Email sent!"
            } else {
                message = "Failed to create account. Try again."
            }
        } catch {
            message = "Error: \(error.localizedDescription)"
        }
    }
}



#Preview {
    CreateUserView()
}
