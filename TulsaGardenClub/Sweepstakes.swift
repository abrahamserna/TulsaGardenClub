//
//  Sweepstakes.swift
//  TulsaGardenClub
//
//  Created by AM Student on 11/14/25.
//

import SwiftUI

struct Sweepstakes: View {
    
    @State private var selection1 = 0
    @State private var selection2 = 0
    @State private var selection3 = 0
    let options = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    var totalPoints: Int {
        selection1 + selection2 + selection3
    }
    
    
    @State private var exhibitNumber: String = ""
    
    @State private var numberOfExhibits1: String = ""
    @State private var numberOfExhibits2: String = ""
    @State private var numberOfExhibits3: String = ""
    
    @State private var points: String = ""


    
    let numbersArray = Array(1...150)
    @State private var selectedNumber = 1
    
    let pointsArray = Array(1...5)
    @State private var selectedPoints = 1
    
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Exhibitor Info")) {
                    TextField("Exhibitor Number", text: $exhibitNumber)
                    
                    Picker("Number of Exhibits", selection: $selectedNumber) {
                        ForEach(numbersArray, id: \.self) { number in
                            Text(String(number))
                            
                        }
                    }
                    .pickerStyle(.menu)
                    
                    // Use this style for the classic rolling picker
                    
                }
                Section(header: Text("Exhibit #                                            Exhibit Points")) {
                    HStack {
                        TextField("Exhibit #", text: $numberOfExhibits1)
                        Picker("Points", selection: $selection1) {
                            ForEach(pointsArray, id: \.self) { number in
                                Text(String(number))
                                
                            }
                        }
                        .pickerStyle(.menu)
                        
                    }
                    HStack {
                        TextField("Exhibit #", text: $numberOfExhibits2)
                        Picker("Points", selection: $selection2) {
                            ForEach(pointsArray, id: \.self) { number in
                                Text(String(number))
                                
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    HStack {
                        TextField("Exhibit #", text: $numberOfExhibits3)
                        Picker("Points", selection: $selection3) {
                            ForEach(pointsArray, id: \.self) { number in
                                Text(String(number))
                                
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    
                    
                }
                Section(header: Text("TOTAL POINTS")) {
                    Text("Total Points: \(totalPoints)")
                    
                }
            }
            .navigationBarTitle("Sweepstakes")
        }
    }
}
#Preview {
    Sweepstakes()
}
