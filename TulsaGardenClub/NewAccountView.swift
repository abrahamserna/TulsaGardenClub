////
////  NewAccountView.swift
////  TulsaGardenClub
////
////  Created by AM Student on 11/10/25.
////
//
//import FirebaseAuth
//import FirebaseFirestoreSwift
//
//class FirebaseManager {
//    private let db = Firestore.firestore()
//    
//    func createAdminAccount(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
//        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            
//            guard let uid = authResult?.user.uid else {
//                completion(.failure(NSError(domain: "Firebase", code: -1, userInfo: [NSLocalizedDescriptionKey: "Missing UID"])))
//                return
//            }
//            
//            let adminUser = AdminUser(id: uid, email: email, role: "admin")
//            
//            do {
//                try self.db.collection("users").document(uid).setData(from: adminUser)
//                completion(.success(()))
//            } catch {
//                completion(.failure(error))
//            }
//        }
//    }
//}
//
//struct AdminUser: Identifiable, Codable {
//    var id: String        // Firebase UID
//    var email: String
//    var role: String = "admin"
//}
//
