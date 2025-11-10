//
//  SplashScreenView.swift
//  TulsaGardenClub
//
//  Created by AM Student on 10/21/25.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    @State private var size = 0.5
    @State private var opacity = 0.5
    

     
    var body: some View {
        if isActive {
            ContentView()
        } else {
            
            VStack {
                Image("ClubLogo")
                    .resizable()
                    .frame(width: 200, height: 200)
                   
                }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1.2)) {
                    size = 0.9
                    opacity = 1
                }
            
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    isActive = true
                }
            }
        }
    }
}


     
    


#Preview {
    SplashScreenView()
}
