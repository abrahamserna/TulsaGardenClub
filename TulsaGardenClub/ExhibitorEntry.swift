//
//  ExhibitorEntry.swift
//  TulsaGardenClub
//
//  Created by AM Student on 11/12/25.
//

import SwiftUI

struct ExhibitorEntry: View {

    @State private var emailAddress: String = ""
    @State private var exhibitorName: String = ""
    @State private var phoneNumber: String = ""
    @State private var clubName: String = ""
    
    @State private var Division: String = ""
    @State private var sectionName: String = ""
    @State private var sectionChair: String = ""
    @State private var className: String = ""
    @State private var classNumber: String = ""
    @State private var award: String = ""
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Exhibitor Information")) {
                    TextField("Exhibitor Name", text: $exhibitorName)
                    TextField("Email Address", text: $emailAddress)
                    TextField("Phone Number", text: $phoneNumber)
                    TextField("Club Name", text: $clubName)
                }
                Section(header: Text("Exhibit Information")) {
                    Picker("Division #", selection: $Division) {
                        Text("I").tag("Division 1")
                        Text("II").tag("Division 2")
                        Text("III").tag("Division 3")
                        Text("IV").tag("Division 4")
                        Text("V").tag("Division 5")
                        Text("VI").tag("Division 6")
                    }
                    Picker("Section Name", selection: $sectionName) {
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
                    Picker("Class #", selection: $classNumber) {
                        Text("1").tag("Class 1")
                        Text("2").tag("Class 2")
                        Text("3").tag("Class 3")
                        Text("4").tag("Class 4")
                        Text("5").tag("Class 5")
                        Text("6").tag("Class 6")
                        Text("7").tag("Class 7")
                        Text("8").tag("Class 8")
                        Text("9").tag("Class 9")
                        Text("10").tag("Class 10")
                        Text("11").tag("Class 11")
                        Text("12").tag("Class 12")
                        Text("13").tag("Class 13")
                        Text("14").tag("Class 14")
                        Text("15").tag("Class 15")
                        Text("16").tag("Class 16")
                        Text("17").tag("Class 17")
                        Text("18").tag("Class 18")
                        Text("19").tag("Class 19")
                        Text("20").tag("Class 20")
                        Text("21").tag("Class 21")
                        Text("22").tag("Class 22")
                        Text("23").tag("Class 23")
                        Text("24").tag("Class 24")
                        Text("25").tag("Class 25")
                        Text("26").tag("Class 26")
                        Text("27").tag("Class 27")
                        Text("28").tag("Class 28")
                        Text("29").tag("Class 29")
                        Text("30").tag("Class 30")
                        Text("31").tag("Class 31")
                        Text("32").tag("Class 32")
                        Text("33").tag("Class 33")
                        Text("34").tag("Class 34")
                        Text("35").tag("Class 35")
                        Text("36").tag("Class 36")
                        Text("37").tag("Class 37")
                        Text("38").tag("Class 38")
                        Text("39").tag("Class 39")
                        Text("40").tag("Class 40")
                        Text("41").tag("Class 41")
                        Text("42").tag("Class 42")
                        Text("43").tag("Class 43")
                        Text("44").tag("Class 44")
                        Text("45").tag("Class 45")
                        Text("46").tag("Class 46")
                        Text("47").tag("Class 47")
                        Text("48").tag("Class 48")
                        Text("49").tag("Class 49")
                        Text("50").tag("Class 50")
                        
                    }
                    TextField("Class Name", text: $className)
                    
                    Picker("Award", selection: $award) {
                        Text("1st").tag("1st")
                        Text("2nd").tag("2nd")
                        Text("3rd").tag("3rd")
                        Text("Honorable Mention").tag("HM")
                        
                    }
                    
                }
                
            }
            NavigationLink(destination: FinalJudge()) {
                Text("Continue")
                    .font(.title2)
                    .padding()
                    .background(Color.green2)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .navigationTitle("Exhibitor Entry")
            
        }

    }
}

#Preview {
    ExhibitorEntry()
}
