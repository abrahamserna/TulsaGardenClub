////
////  TestFile.swift
////  TulsaGardenClub
////
////  Created by AM Student on 12/3/25.
////
////
//import SwiftUI
////import Firebase
////import Foundation
////import StoreKit // Required for @DocumentID if using Firestore
////
////struct TestFile: Codable, Identifiable { // Conform to Identifiable for use in SwiftUI Lists
////    @DocumentID var id: String? // Maps the document ID from Firestore
////    var title: String
////    var author: String
////    var numberOfPages: Int
////}
////
////
////struct TestFile: ButtonStyle {
////    func makeBody(configuration: Configuration) -> some View {
////        configuration.label
////            .frame(width: 240)
////            .font(.title2.bold())
////            .padding()
////            .foregroundColor(configuration.isPressed ? .darkGreen : .lightGreen)
////            .background(configuration.isPressed ? Color.white : Color.darkGreen)
////
////            .cornerRadius(10)
////            .scaleEffect(configuration.isPressed ? 0.95 : 1.0) // subtle press shrink
////            .animation(.easeInOut(duration: 0.25), value: configuration.isPressed)
////    }
////}
////
////Button {
////    loginUser()
////} label: {
////    Text("LOGIN")
////}
////.buttonStyle(LoginButtonStyle())
////
//
//import SwiftUI
//
//struct TestFile: View {
//    var body: some View {
//        NavigationStack {
//            VStack(spacing: 20) {
//                
//                // Regular login button
//                Button("LOGIN") {
//                    loginUser()
//                }
//             
//                
//                // Distinct admin button
//                NavigationLink(destination: ViewsScreen()) {
//                    HStack {
//                        Image(systemName: "lock.open.fill") // icon for admin
//                            .font(.title2)
//                        Text("ADMIN ACCESS")
//                            .font(.title2.bold())
//                    }
//                    .frame(width: 260, height: 55)
//                    .foregroundColor(.white)
//                    .background(
//                        LinearGradient(
//                            colors: [.red, .orange],
//                            startPoint: .leading,
//                            endPoint: .trailing
//                        )
//                    )
//                    .cornerRadius(12)
//                    .shadow(color: .red.opacity(0.5), radius: 6, x: 0, y: 4)
//                }
//            }
//            .navigationTitle("Welcome")
//        }
//    }
//}
//
//struct ViewsScreen: View {
//    var body: some View {
//        Text("This is the Views screen")
//            .font(.largeTitle)
//            .padding()
//    }
//}
//
//
//#Preview {
//    AdminLoginButton()
//}
//
//
