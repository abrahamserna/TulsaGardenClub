//
//  Views.swift
//  TulsaGardenClub
//
//  Created by AM Student on 11/10/25.
//

import SwiftUI
 import Firebase

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
                                .foregroundStyle(.primary)
                            Text("Abraham Serna")
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(.primary)
                            Text("Tulsa Garden Club")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        
                        .position(x: 150, y: 50)
                        
                        VStack {
                            AutoScrollingView()
                                .position(x: 200, y: 350)
                            
                            
                            NavigationLink(destination: ExhibitorEntryView()) {
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
                                            .foregroundColor(.whiteText)
                                            .font(.title2)
                                        
                                        Text("Enter Information Here")
                                            .font(.caption)
                                            .foregroundColor(.whiteText)
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
                                        
                                        Image(systemName: "apple.meditate.circle")
                                            .foregroundColor(.white2)
                                            .font(.system(size: 30))
                                            
                                    }
                                    .position(x: 40, y: 40)
                                    VStack(alignment: .leading) {
                                        Text("Sweepstakes")
                                            .foregroundColor(.whiteText)
                                            .font(.title2)
                                        Text("Enter Information Here")
                                            .font(.caption)
                                            .foregroundColor(.whiteText)
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
       
        }
            .navigationBarBackButtonHidden(true)
    }
}
 


struct ProfileView: View {
    @State private var exhibitors: [Exhibitor] = []
    @State private var isLoading = true
    @State private var showDeleteAlert = false
    @State private var exhibitorToDelete: Exhibitor?

    
    let firebaseManager = FirebaseManager()
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Entries")) {
                    if isLoading {
                        ProgressView("Loading entries...")
                    } else if exhibitors.isEmpty {
                        Text("No entries found")
                            .foregroundColor(.secondary)
                    } else {
                        ForEach(exhibitors) { exhibitor in
                            VStack(alignment: .leading) {
                                Text("\(exhibitor.firstName) \(exhibitor.lastName)")
                                    .font(.headline)
                                Text("Division: \(exhibitor.division) | Placement: \(exhibitor.placement)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                
               
                Section(header: Text("Admin Tools")) {
                    Button("Export Report") {
                        // TODO: implement export logic
                    }
                    Button("Manage Templates") {
                        // TODO: show template view
                    }
                }
            }
            .navigationTitle("Admin Dashboard")
            .onAppear {
                // 🔴 Attach listeners
                firebaseManager.listenForNewExhibitors { newExhibitor in
                    exhibitors.append(newExhibitor)
                    isLoading = false
                }
                
                firebaseManager.listenForChangedExhibitors { updatedExhibitor in
                    if let index = exhibitors.firstIndex(where: { $0.id == updatedExhibitor.id }) {
                        exhibitors[index] = updatedExhibitor
                    }
                }
                
                firebaseManager.listenForRemovedExhibitors { removedKey in
                    exhibitors.removeAll { $0.id == removedKey }
                }
            }
        }
    }
    
}

 
import SwiftUI

struct SettingView: View {
    @State private var notification = false
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = true
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Toggle(isOn: $notification) {
                        HStack {
                            Image(systemName: "bell")
                            Text("Notifications")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: PrivacyPolicy()) {
                        HStack {
                            Image(systemName: "lock")
                            Text("Privacy Policy")
                        }
                    }
                    
                    NavigationLink(destination: TermsandConditions()) {
                        HStack {
                            Image(systemName: "book")
                            Text("Terms and Conditions")
                        }
                    }
                    
                    NavigationLink(destination: Contact()) {
                        HStack {
                            Image(systemName: "envelope")
                            Text("Contact")
                        }
                    }
                    
                    NavigationLink(destination: Feedback()) {
                        HStack {
                            Image(systemName: "message")
                            Text("Feedback")
                        }
                    }
                }
                
                Section {
                    Button {
                        isLoggedIn = false   // 🔴 actually logs out
                    } label: {
                        HStack {
                            Image(systemName: "rectangle.portrait.and.arrow.forward")
                            Text("Logout")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Settings")
            .overlay(
                Image("LogoDark")
                    .resizable()
                    .opacity(0.5)
                    .frame(width: 100, height: 90),
                alignment: .bottom
            )
        }
        .navigationBarBackButtonHidden(true)
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
            .cornerRadius(0)
            .background(Color(.white2))
            
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
                                .foregroundColor(selectedTab == tab ? .primary : .whiteText)
                        }
                        .frame(maxWidth: .infinity)
                        
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 8)
            .padding(.bottom, 12)
            .foregroundColor(.whiteText)
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Views()
}
