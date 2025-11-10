//
//  Views.swift
//  TulsaGardenClub
//
//  Created by AM Student on 11/10/25.
//

import SwiftUI
 
struct HomeView: View {
    var body: some View {
        VStack {
            Text("TULSA GARDEN CLUB")
                .font(.largeTitle)
                .bold()
            Spacer()
        }
        .padding()
    }
}
 
struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Profile Screen")
                .font(.largeTitle)
                .bold()
            Spacer()
        }
        .padding()
    }
}
 
struct SettingView: View {
    var body: some View {
        VStack {
            Text("Settings Screen")
                .font(.largeTitle)
                .bold()
            Spacer()
        }
        .padding()
    }
}
 
struct Views: View {
    
    @State private var selectedTab: Tab = .home
    
    enum Tab: CaseIterable {
        case home, profile, settings
        
        var icon: String {
            switch self {
            case .home: return "RedRose"
            case .profile: return "OrangeFlower"
            case .settings: return "GreenFlower"
            }
        }
        
        var title: String {
            switch self {
            case .home: return "Home"
            case .profile: return "Profile"
            case .settings: return "Settings"
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            // Main View Area
            ZStack {
                switch selectedTab {
                case .home:
                    HomeView()
                case .profile:
                    ProfileView()
                case .settings:
                    SettingView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemBackground))
            
            // Minimal Modern Tab Bar
            HStack {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Button {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            selectedTab = tab
                        }
                    } label: {
                        VStack(spacing: 4) {
                            ZStack {
                                Circle()
                                    .stroke(selectedTab == tab ? Color.primary.opacity(0.25) : Color.clear, lineWidth: 2)
                                    .frame(width: 48, height: 48)
                                
                                Image(tab.icon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 26, height: 26)
                                    .opacity(selectedTab == tab ? 1 : 0.55)
                                    .scaleEffect(selectedTab == tab ? 1.1 : 1.0)
                            }
                            
                            Text(tab.title)
                                .font(.caption)
                                .foregroundColor(selectedTab == tab ? .primary : .gray)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 8)
            .padding(.bottom, 12)
            .background(.ultraThinMaterial)
            
        }
    }
}
