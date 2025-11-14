//
//  ExhibitorEntry.swift
//  TulsaGardenClub
//
//  Created by AM Student on 11/12/25.
//

import SwiftUI
import FirebaseDatabase
import Firebase
struct Exhibtor: Codable, Identifiable {
    var id = UUID().uuidString
    var firstName: String
    var lastName: String
    var address: String
    var club: String
    var division: String
    var section: String
    var Class: String
    var placement: String
}
 
class FirebaseManager {
    
    private let ref = Database.database().reference()
    
    func addExhibitor(
        
        exhibitorFirstName: String,
        exhibitorLastName: String,
        exhibitorAddress: String,
        exhibitorClub: String,
        exhibitorDivision: String,
        exhibitorSection: String,
        exhibitorClass: String,
        exhibitorPlacement: String
        
    ) {
        
        let exhibitorRef = ref.child("Exhibitors").childByAutoId()
        
        let exhibitorData: [String: Any] = [
            
            "ExhibitorFirstName": exhibitorFirstName,
            "ExhibitorLastName": exhibitorLastName,
            "ExhibitorAddress": exhibitorAddress,
            "ExhibitorClub": exhibitorClub,
            "ExhibitorDivision": exhibitorDivision,
            "ExhibitorSection": exhibitorSection,
            "ExhibitorClass": exhibitorClass,
            "ExhibitorPlacement": exhibitorPlacement
        ]
        
        exhibitorRef.setValue(exhibitorData)
        
    }
    
    
}
 
import SwiftUI
import FirebaseDatabase
 
struct ExhibtorEntryView: View {
    
   @State var exhibitor: String = ""
   @State var address: String = ""
   @State var club: String = ""
    
    @State private var exhibitorFirstName = ""
    @State private var exhibitorLastName = ""
    @State private var exhibitorDivision = ""
    @State private var exhibitorSection = ""
    @State private var exhibitorClass = ""
    @State private var exhibitorAddress = ""
    @State private var exhibitorPlacement = ""
    @State private var exhibitorClub = ""
    

    
    let firebaseManager = FirebaseManager()
    
    var body: some View {
        VStack {
         
                Form {
                    Section(header: Text("Exhibitor Info")) {
                        TextField("First Name", text: $exhibitorFirstName)
                        
                        TextField("Last Name", text: $exhibitorLastName)
                        
                        TextField("Address", text: $exhibitorAddress)
                        
                        TextField("Club", text: $exhibitorClub)
                        
                    }
                    
                    Section(header: Text("Exhibit Information")) {
                        
                        Picker("Division", selection: $exhibitorDivision)
                        {
                            Text("I").tag("Division 1")
                            Text("II").tag("Division 2")
                            Text("III").tag("Division 3")
                            Text("IV").tag("Division 4")
                            Text("V").tag("Division 5")
                            Text("VI").tag("Division 6")
                            
                            
                        }
                        
                        Picker("Section", selection: $exhibitorSection){
                            Text("A").tag("Section A")
                            Text("B").tag("Section B")
                            Text("C").tag("Section C")
                            Text("D").tag("Section D")
                            Text("E").tag("Section E")
                            Text("F").tag("Section F")
                            Text("G").tag("Section G")
                            Text("H").tag("Section H")
                            Text("I").tag("Section I")
                            Text("J").tag("Section J")
                            Text("K").tag("Section K")
                            Text("L").tag("Section L")
                            Text("M").tag("Section M")
                            Text("N").tag("Section N")
                            Text("O").tag("Section O")
                            Text("P").tag("Section P")
                            Text("Q").tag("Section Q")
                            Text("R").tag("Section R")
                            Text("S").tag("Section S")
                            Text("T").tag("Section T")
                            Text("U").tag("Section U")
                            Text("V").tag("Section V")
                            Text("W").tag("Section W")
                            Text("X").tag("Section X")
                            Text("Y").tag("Section Y")
                            Text("Z").tag("Section Z")
                        }
                        
                        Picker("Class", selection: $exhibitorClass)
                        {
                            Text("A").tag("Section A")
                            Text("B").tag("Section B")
                            Text("C").tag("Section C")
                            Text("D").tag("Section D")
                            Text("E").tag("Section E")
                            Text("F").tag("Section F")
                            Text("G").tag("Section G")
                            Text("H").tag("Section H")
                            Text("I").tag("Section I")
                            Text("J").tag("Section J")
                            Text("K").tag("Section K")
                            Text("L").tag("Section L")
                            Text("M").tag("Section M")
                            Text("N").tag("Section N")
                            Text("O").tag("Section O")
                            Text("P").tag("Section P")
                            Text("Q").tag("Section Q")
                            Text("R").tag("Section R")
                            Text("S").tag("Section S")
                            Text("T").tag("Section T")
                            Text("U").tag("Section U")
                            Text("V").tag("Section V")
                            Text("W").tag("Section W")
                            Text("X").tag("Section X")
                            Text("Y").tag("Section Y")
                            Text("Z").tag("Section Z")
                        }
             
                           
                            
                            
                        }
                    
                    Picker("Placement", selection: $exhibitorPlacement){
                        Text("1st(4 Points)").tag("1st(4 Points)")
                        Text("2nd(3 Points)").tag("2nd(3 Points)")
                        Text("3rd(2 Points)").tag("3rd(2 Points)")
                        Text("Honorable Mention(1 Point)").tag("Honorable Mention(1 Point)")
                    }
                    
                   
                    
                    
                }
                .foregroundColor(.black)
                .background(Color.lightgreen)
                .scrollContentBackground(.hidden)
                
//                .navigationBarBackButtonHidden(true)
                
                Button {
                    
                    firebaseManager.addExhibitor (
                        
                        exhibitorFirstName: exhibitorFirstName,
                        exhibitorLastName: exhibitorLastName,
                        exhibitorAddress: exhibitorAddress,
                        exhibitorClub: exhibitorClub,
                        exhibitorDivision: exhibitorDivision,
                        exhibitorSection: exhibitorSection,
                        exhibitorClass: exhibitorClass,
                        exhibitorPlacement: exhibitorPlacement
                        
                        
                    )
                    
                } label: {
                    
                    NavigationLink(destination: Views()) {
                        Text("Finalize")
                            .frame(width: 90, height: 30)
                            .font(.title2.bold())
                            .foregroundStyle(.white)
                        
                    }
                    .padding()
                    .background(Color.darkgreen)
                    
                    .cornerRadius(16)
                    
                    
                }
                
            }
        
//        .background(Color.lightgreen)
//        NavigationLink(destination: Views()) {
//            Text("Home")
//                .font(.headline)
//                .padding()
//                .background(Color.orange)
//                .foregroundColor(.white)
//                .cornerRadius(10)
//            
//        }
      
        }
        
    }
    

 

#Preview {
    ExhibtorEntryView()
}
