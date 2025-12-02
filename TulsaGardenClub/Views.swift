//
//  Views.swift
//  TulsaGardenClub
//
//  Created by AM Student on 11/10/25.
//

import SwiftUI
 
struct HomeView: View {
    var body: some View {
        @State var showExhibitorEntry = false
      
            VStack {
                
                NavigationStack {
                    ZStack {
                        LinearGradient(colors: [.lightgreen, .darkgreen], startPoint: .top, endPoint: .bottom)
                            .ignoresSafeArea()
                        Image("TGCLogo")
                            .resizable()
                            
                        
                            .frame(width: 75, height: 65)
                            .position(x: 340, y: -70)
                        VStack {
                            
                            Spacer()
                            
                            
                            NavigationLink(destination: ExhibtorEntryView()) {
                                Text("Exhibitor Entry")
                                    .font(.title2)
                                    .padding()
                                    .background(Color.green2)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding()
                            }
                            NavigationLink(destination: Sweepstakes()) {
                                Text("Sweepstakes")
                                    .font(.title2)
                                    .padding()
                                    .background(Color.green2)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                        
                        .position(x: 200, y:-100)
                        
                        .navigationTitle(Text("Welcome"))
                    }
            }
                .navigationBarBackButtonHidden(true)
        }
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
    @State private var notification = false
    @State private var privacyPolicy = ""
    @State private var termsAndConditions = ""
    @State private var contact = ""
    @State private var feedback = ""
    @State private var logout = ""
    var body: some View {
        VStack {
            NavigationStack {
               
                
                HStack {
                    
                    Form {
                        HStack {
                            Image(systemName: "bell")
                            Toggle("Notifications", isOn: $notification)
                            
                        }
                        HStack {
                            NavigationLink(destination: PrivacyPolicy()) {
                                
                                Image(systemName: "lock")
                                Text("Privacy Policy")
                                
                                
                            }
                        }
                        HStack {
                            NavigationLink(destination: PrivacyPolicy()) {
                                
                                Image(systemName: "book")
                                Text("Terms and Conditions")
                                
                                
                            }
                        }
                        HStack {
                            NavigationLink(destination: Contact()) {
                                
                                Image(systemName: "envelope")
                                Text("Contact")
                                
                                
                            }
                        }
                        HStack {
                            NavigationLink(destination: Feedback()) {
                                
                                Image(systemName: "message")
                                Text("Feedback")
                                
                                
                            }
                        }
                        Section {
                            HStack {
                                NavigationLink(destination: ContentView()) {
                                    
                                    Image(systemName: "rectangle.portrait.and.arrow.forward")
                                    Text("Logout")
                                    
                                    
                                }
                                
                            }
                            
                        }
                
                    }
                    .navigationTitle(Text("Settings"))
                }
                
            }
        }
      
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
            .frame(width: 402, height: 700)
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

#Preview {
    Views()
}
