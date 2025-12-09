//
//  ExhibitorEntry.swift
//  TulsaGardenClub
//
//  Created by AM Student on 11/12/25.
//

import SwiftUI
import FirebaseDatabase
import Firebase
import UIKit



struct Exhibitor: Codable, Identifiable {
    var id = UUID().uuidString
    var firstName: String = ""
    var lastName: String = ""
    var address: String = ""
    var club: String = ""
    var division: String = ""
    var section: String = ""
    var exhibitorClass: String = ""
    var placement: String = ""
}


 
import FirebaseDatabase

class FirebaseManager {
    private let ref = Database.database().reference()
    
    func addExhibitor(_ exhibitor: Exhibitor) {
        let safeFirst = exhibitor.firstName.replacingOccurrences(of: " ", with: "_")
        let safeLast = exhibitor.lastName.replacingOccurrences(of: " ", with: "_")
        let key = "\(safeFirst)_\(safeLast)_\(UUID().uuidString.prefix(6))"
        
        let exhibitorRef = ref.child("Exhibitors").child(key)
        
        do {
            let data = try JSONEncoder().encode(exhibitor)
            let dict = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            exhibitorRef.setValue(dict)
        } catch {
            print("Error encoding exhibitor: \(error)")
        }
    }
    
    func fetchExhibitors(completion: @escaping ([Exhibitor]) -> Void) {
        ref.child("Exhibitors").observeSingleEvent(of: .value) { snapshot in
            var exhibitors: [Exhibitor] = []
            for child in snapshot.children {
                if let snap = child as? DataSnapshot,
                   let dict = snap.value as? [String: Any] {
                    do {
                        let data = try JSONSerialization.data(withJSONObject: dict)
                        let exhibitor = try JSONDecoder().decode(Exhibitor.self, from: data)
                        exhibitors.append(exhibitor)
                    } catch {
                        print("Error decoding exhibitor: \(error)")
                    }
                }
            }
            completion(exhibitors)
        }
    }
    
    // 🔴 Live listeners
    func listenForNewExhibitors(completion: @escaping (Exhibitor) -> Void) {
        ref.child("Exhibitors").observe(.childAdded) { snapshot in
            if let dict = snapshot.value as? [String: Any] {
                do {
                    let data = try JSONSerialization.data(withJSONObject: dict)
                    let exhibitor = try JSONDecoder().decode(Exhibitor.self, from: data)
                    completion(exhibitor)
                } catch {
                    print("Error decoding exhibitor: \(error)")
                }
            }
        }
    }
    
    func listenForChangedExhibitors(completion: @escaping (Exhibitor) -> Void) {
        ref.child("Exhibitors").observe(.childChanged) { snapshot in
            if let dict = snapshot.value as? [String: Any] {
                do {
                    let data = try JSONSerialization.data(withJSONObject: dict)
                    let exhibitor = try JSONDecoder().decode(Exhibitor.self, from: data)
                    completion(exhibitor)
                } catch {
                    print("Error decoding exhibitor: \(error)")
                }
            }
        }
    }
    
    func listenForRemovedExhibitors(completion: @escaping (String) -> Void) {
        ref.child("Exhibitors").observe(.childRemoved) { snapshot in
            completion(snapshot.key)
        }
    }
}



 




struct ExhibitorEntryView: View {
    @State private var exhibitor = Exhibitor()
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var navigateToViews = false
    @State private var showCancelAlert = false
    @State private var showToast = false
    
    @Environment(\.dismiss) private var dismiss
    
    let firebaseManager = FirebaseManager()
    
    var body: some View {
        ZStack {
            VStack {
                Form {
                    Section(header: Text("Exhibitor Info")) {
                        TextField("First Name", text: $exhibitor.firstName)
                        TextField("Last Name", text: $exhibitor.lastName)
                        TextField("Address", text: $exhibitor.address)
                        TextField("Club", text: $exhibitor.club)
                    }
//                    
                    Section(header: Text("Exhibit Information")) {
                        Picker("Division", selection: $exhibitor.division) {
                            Text("I").tag("Division 1")
                            Text("II").tag("Division 2")
                            Text("III").tag("Division 3")
                            Text("IV").tag("Division 4")
                            Text("V").tag("Division 5")
                            Text("VI").tag("Division 6")
                        }
//                        
                        Picker("Section", selection: $exhibitor.section) {
                            Text("A").tag("A")
                            Text("B").tag("B")
                            Text("C").tag("C")
                            Text("D").tag("D")
                            Text("E").tag("E")
                            Text("F").tag("F")
                            Text("G").tag("G")
                            Text("H").tag("H")
                            Text("I").tag("I")
                            Text("J").tag("J")
                            Text("K").tag("K")
                            Text("L").tag("L")
                            Text("M").tag("M")
                            Text("N").tag("N")
                            Text("O").tag("O")
                            Text("P").tag("P")
                            Text("Q").tag("Q")
                            Text("R").tag("R")
                            Text("S").tag("S")
                            Text("T").tag("T")
                            Text("U").tag("U")
                            Text("V").tag("V")
                            Text("W").tag("W")
                            Text("X").tag("X")
                            Text("Y").tag("Y")
                            Text("Z").tag("Z")
                            
                            
                        }
//
                        Picker("Class", selection: $exhibitor.exhibitorClass) {
//
                        Text("B").tag("B")
                        Text("C").tag("C")
                        Text("D").tag("D")
                        Text("E").tag("E")
                        Text("F").tag("F")
                        Text("G").tag("G")
                        Text("H").tag("H")
                        Text("I").tag("I")
                        Text("J").tag("J")
                        Text("K").tag("K")
                        Text("L").tag("L")
                        Text("M").tag("M")
                        Text("N").tag("N")
                        Text("O").tag("O")
                        Text("P").tag("P")
                        Text("Q").tag("Q")
                        Text("R").tag("R")
                        Text("S").tag("S")
                        Text("T").tag("T")
                        Text("U").tag("U")
                        Text("V").tag("V")
                        Text("W").tag("W")
                        Text("X").tag("X")
                        Text("Y").tag("Y")
                        Text("Z").tag("Z")
                        }
//                        
                        Picker("Placement", selection: $exhibitor.placement) {
                            Text("1st (4 Points)").tag("1st(4 Points)")
                            Text("2nd (3 Points)").tag("2nd(3 Points)")
                            Text("3rd (2 Points)").tag("3rd(2 Points)")
                            Text("Honorable Mention (1 Point)").tag("Honorable Mention(1 Point)")
                        }
                    }
                }
                
                HStack(spacing: 20) {
                    Button("Finalize") {
                        if validateExhibitor() {
                            firebaseManager.addExhibitor(exhibitor)
                            
                            // Haptic feedback
                            UINotificationFeedbackGenerator().notificationOccurred(.success)
                            
                            withAnimation { showToast = true }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation { showToast = false }
                                navigateToViews = true
                            }
                        } else {
                            showAlert = true
                        }
                    }
                    .padding()
                    .background(Color.green)
                    .cornerRadius(16)
                    .foregroundColor(.white)
                    
                    Button("Go Back") {
                        showCancelAlert = true
                    }
                    .padding()
                    .background(Color.red)
                    .cornerRadius(16)
                    .foregroundColor(.white)
                }
                
                NavigationLink(destination: Views(), isActive: $navigateToViews) {
                    EmptyView()
                }
            }
            
            if showToast {
                VStack {
                    Button(action: { withAnimation { showToast = false } }) {
                        Text("Entry Submitted Successfully")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green.opacity(0.9))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .shadow(radius: 4)
                            .padding(.top, 20)
                    }
                    .transition(.move(edge: .top).combined(with: .opacity))
                    Spacer()
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Validation Error"),
                  message: Text(alertMessage),
                  dismissButton: .default(Text("OK")))
        }
        .alert(isPresented: $showCancelAlert) {
            Alert(
                title: Text("Confirm Cancel"),
                message: Text("Are you sure you want to cancel? All entered data will be lost."),
                primaryButton: .destructive(Text("Yes, Cancel")) { dismiss() },
                secondaryButton: .cancel()
            )
        }
    }
    
    private func validateExhibitor() -> Bool {
        if exhibitor.firstName.isEmpty { alertMessage = "First name is required."; return false }
        if exhibitor.lastName.isEmpty { alertMessage = "Last name is required."; return false }
        if exhibitor.division.isEmpty { alertMessage = "Division must be selected."; return false }
        if exhibitor.section.isEmpty { alertMessage = "Section must be selected."; return false }
        if exhibitor.exhibitorClass.isEmpty { alertMessage = "Class must be selected."; return false }
        if exhibitor.placement.isEmpty { alertMessage = "Placement must be selected."; return false }
        return true
    }
}

    

 

#Preview {
    ExhibitorEntryView()
}
