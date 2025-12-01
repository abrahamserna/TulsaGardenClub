//
//  PrivacyPolicy.swift
//  TulsaGardenClub
//
//  Created by AM Student on 12/1/25.
//

import SwiftUI

struct PrivacyPolicy: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "lock")
                
                
                Text("Privacy Policy")
            }
            .padding()
            Text("🌱 Tulsa Garden Club Privacy Policy Mock Draft Effective Date: December 1, 2025 Tulsa Garden Club (“we,” “our,” or “us”) values your privacy. This Privacy Policy explains how we collect, use, and protect your information when you use our mobile application and related services. 📋 Information We Collect Personal Information: Name, email address, and optional profile details you provide when signing up. Usage Data: App interactions, features used, and preferences to improve your experience. Location Data: If enabled, we may collect approximate location to suggest nearby gardening events. Device Information: Technical details such as device type, operating system, and app version. 🔎 How We Use Your Information Provide Services: To deliver core app features like event listings and gardening tips. Improve Experience: Analyze usage patterns to enhance usability and performance. Communications: Send updates, newsletters, or event reminders (you can opt out anytime). Safety & Compliance: Detect misuse and comply with legal obligations. 🤝 Sharing of Information We do not sell your personal data. We may share limited information with: Service Providers: Trusted partners who help us operate the app. Community Features: Information you choose to share in public forums or event boards. Legal Authorities: When required by law or to protect rights and safety. 🔐 Data Security Encryption: Sensitive data is encrypted during transmission. Access Controls: Only authorized personnel can access user information.  Regular Reviews: We periodically update security practices to safeguard your data. 🧑‍🤝‍🧑 Your Choices  Account Settings: Update or delete your profile information anytime. Opt-Out: Manage communication preferences in the app. Permissions: Control access to location, notifications, and contacts through your device settings. 📲 Support  If you have any concerns about your privacy or have questions about how we handle your data, please contact us at: Tulsa Garden Club Support Email: support@tulsagardenclub.app Phone Number:📞 Contact Us ")
                
              
        }
        .padding()
    }
}

#Preview {
    PrivacyPolicy()
}
