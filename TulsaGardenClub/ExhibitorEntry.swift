//
//  ExhibitorEntry.swift
//  TulsaGardenClub
//
//  Created by AM Student on 11/12/25.
//

import SwiftUI
import FirebaseDatabase
import Firebase
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

 
class FirebaseManager {
    private let ref = Database.database().reference()
    
    func addExhibitor(_ exhibitor: Exhibitor) {
        // Build a readable key using first + last name
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
}

 
import SwiftUI
import FirebaseDatabase
 
struct ExhibitorEntryView: View {
    @State private var exhibitor = Exhibitor()
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var navigateToViews = false
    
    let firebaseManager = FirebaseManager()
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Exhibitor Info")) {
                    TextField("First Name", text: $exhibitor.firstName)
                    TextField("Last Name", text: $exhibitor.lastName)
                    TextField("Address", text: $exhibitor.address)
                    TextField("Club", text: $exhibitor.club)
                }
                
                Section(header: Text("Exhibit Information")) {
                    Picker("Division", selection: $exhibitor.division) {
                        Text("I").tag("Division 1")
                        Text("II").tag("Division 2")
                        Text("III").tag("Division 3")
                        Text("IV").tag("Division 4")
                        Text("V").tag("Division 5")
                        Text("VI").tag("Division 6")
                    }
                    
                    Picker("Section", selection: $exhibitor.section) {
                        ForEach(["A","B","C","D","E","F","G","H","I","J","K","L",
                                 "M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"], id: \.self) {
                            Text($0).tag("Section \($0)")
                        }
                    }
                    
                    Picker("Class", selection: $exhibitor.exhibitorClass) {
                        ForEach(["A","B","C","D","E","F","G","H","I","J","K","L",
                                 "M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"], id: \.self) {
                            Text($0).tag("Class \($0)")
                        }
                    }
                    
                    Picker("Placement", selection: $exhibitor.placement) {
                        Text("1st (4 Points)").tag("1st(4 Points)")
                        Text("2nd (3 Points)").tag("2nd(3 Points)")
                        Text("3rd (2 Points)").tag("3rd(2 Points)")
                        Text("Honorable Mention (1 Point)").tag("Honorable Mention(1 Point)")
                    }
                }
            }
            
            Button("Finalize") {
                if validateExhibitor() {
                    firebaseManager.addExhibitor(exhibitor)
                    navigateToViews = true
                } else {
                    showAlert = true
                }
            }
            .padding()
            .background(Color.green)
            .cornerRadius(16)
            .foregroundColor(.white)
            
            NavigationLink(destination: Views(), isActive: $navigateToViews) {
                EmptyView()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Validation Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    private func validateExhibitor() -> Bool {
        if exhibitor.firstName.isEmpty {
            alertMessage = "First name is required."
            return false
        }
        if exhibitor.lastName.isEmpty {
            alertMessage = "Last name is required."
            return false
        }
        if exhibitor.division.isEmpty {
            alertMessage = "Division must be selected."
            return false
        }
        if exhibitor.section.isEmpty {
            alertMessage = "Section must be selected."
            return false
        }
        if exhibitor.exhibitorClass.isEmpty {
            alertMessage = "Class must be selected."
            return false
        }
        if exhibitor.placement.isEmpty {
            alertMessage = "Placement must be selected."
            return false
        }
        return true
    }
}

    

 

#Preview {
    ExhibitorEntryView()
}
