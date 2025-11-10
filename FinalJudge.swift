//
//  FinalJudge.swift
//  TulsaGardenClub
//
//  Created by AM Student on 10/27/25.
//

import SwiftUI

struct FinalJudge: View {
    
    @State private var signature: String = ""
    @State private var comments: String = ""
    var body: some View {
        VStack {
            ZStack {
            NavigationStack {
                Form {
                    Section(header: Text("National Garden Clubs, Inc.")) {
                        TextField("Signature", text: $signature)
                        
                        
                    }
                    TextField("Comments", text: $comments)
                }
                
                .navigationTitle(Text("Judge Information"))
                
            }
                ZStack {
                    Image("ClubLogo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .opacity(0.2)
                }
                
                .position(x: 200, y: 700)
                NavigationLink(destination: HomeView()) {
                    Text("Finalize")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(5)
                }
                
            }
           
        }
     
    }
    
}

#Preview {
    FinalJudge()
}
