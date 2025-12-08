//
//  AutoScrollingView.swift
//  TulsaGardenClub
//
//  Created by AM Student on 12/3/25.
//

import SwiftUI

import SwiftUI

struct AutoScrollingView: View {
    let images = ["11", "111", "1111", "11111"] // Add your asset names here
    
    @State private var currentIndex = 0
    @State private var timer: Timer?
    
    var body: some View {
        GeometryReader { geo in
            TabView(selection: $currentIndex) {
                ForEach(0..<images.count, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                      
                        .frame(width: 390, height: 200)
                        .clipped()
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .onAppear {
                startTimer()
            }
            .onDisappear {
                stopTimer()
            }
        }
    }
    
    // MARK: - Auto Scroll Logic
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { _ in
            withAnimation {
                if currentIndex < images.count - 1 {
                    currentIndex += 1
                } else {
                    currentIndex = 0 // Loop back to first image
                }
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    AutoScrollingView()
}
