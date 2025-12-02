//
//  Feedback.swift
//  TulsaGardenClub
//
//  Created by AM Student on 12/1/25.
//

import SwiftUI

struct Feedback: View {
    @State private var name: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var message: String = ""
    @State private var submitted = false
    
    var body: some View {
        NavigationStack {
            Form {
                if submitted {
                    Text("Thank you for your feedback!")
                        .font(.headline)
                        .padding()
                   
                        
                        NavigationLink {
                            Views()
                        } label: {
                            Text("Go Home")
                                .font(.headline)
                                .padding()
                                .foregroundColor(.black)
                             
                        }
                    
                } else {
                    
                    
                    Section {
                        TextField("Name", text: $name)
                        TextField("Last Name", text: $lastName)
                        TextField("Email", text: $email)
                        
                    }
                    
                    Section {
                        VStack(alignment: .leading) {
                            TextField("Message", text: $message, axis: .vertical)
                                .padding()
                            Spacer()
                            
                                .frame(minHeight: 150)
                            
                                .multilineTextAlignment(.leading)
                            
                            
                            
                        }
                    }
                    
                }
                Button("Submit Form") {
                    self.submitForm()
                }
            }
        }
        .navigationTitle(Text("Feedback"))
    }
    
    
    func submitForm() {
        print("Form submitted: Name - \(name), Email - \(email)")
        
        submitted = true
    }
}
#Preview {
    Feedback()
}
