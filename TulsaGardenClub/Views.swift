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
                        Color.white2
                            .ignoresSafeArea()
                        VStack(alignment: .leading) {
                            Text("Welcome")
                                .font(.title2)
                            Text("John Appleseed")
                                .font(.title)
                                .bold()
                            Text("Tulsa Garden Club")
                                .font(.caption)
                        }
                        .position(x: 150, y: 50)
                        
                        VStack {
                            AutoScrollingView()
                                .position(x: 200, y: 350)
                            
                            
                            NavigationLink(destination: ExhibtorEntryView()) {
                                HStack(alignment: .center) {
                                    ZStack {
                                        Color.green
                                            .frame(width: 50, height: 50)
                                            .cornerRadius(10)
                                        
                                        Image(systemName: "figure.stand")
                                            .foregroundColor(.white2)
                                            .font(.system(size: 30))
                                            
                                    }
                                    .position(x: 40, y: 40)
                                    VStack(alignment: .leading) {
                                        Text("Exhibitor Entry")
                                            .font(.title2)
                                        Text("Enter Information Here")
                                            .font(.caption)
                                        
                                    }
                                    .position(x: 0, y: 40)
                                }
                                    .frame(width: 300, height: 80)
                                    .foregroundStyle(.black)
                                    .cornerRadius(20)
                                    .background(Color.white2)
                              
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.green2, lineWidth: 4)
                                    )
                            }
                            NavigationLink(destination: Sweepstakes()) {
                                HStack(alignment: .center) {
                                    ZStack {
                                        Color.green
                                            .frame(width: 50, height: 50)
                                            .cornerRadius(10)
                                        
                                        Image(systemName: "figure.stand")
                                            .foregroundColor(.white2)
                                            .font(.system(size: 30))
                                            
                                    }
                                    .position(x: 40, y: 40)
                                    VStack(alignment: .leading) {
                                        Text("Sweepstakes")
                                            .font(.title2)
                                        Text("Enter Information Here")
                                            .font(.caption)
                                        
                                    }
                                    .position(x: 0, y: 40)
                                }
                                    .frame(width: 300, height: 80)
                                    .foregroundStyle(.black)
                                    .cornerRadius(20)
                                    .background(Color.white2)
                              
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.green2, lineWidth: 4)
                                    )
                            }
                            .padding()
                        }
                        
                        .position(x: 200, y: 200)
                        
                   
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
            ZStack {
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
                Image("TGCLogo").resizable()
                    .opacity(0.2)
                
                    .frame(width: 100, height: 90)
                    .position(x: 200, y: 600)
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
            .background(.white)
            
        }
    }
}

#Preview {
    Views()
}
