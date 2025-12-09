//
//  Sweepstakes.swift
//  TulsaGardenClub
//
//  Created by AM Student on 11/14/25.
//

import SwiftUI

struct Sweepstakes: View {
    @State private var exhibitNumber: String = ""
    @State private var selectedNumber = 1
    
    @State private var exhibitIDs: [String] = [""]
    @State private var exhibitPoints: [Int] = [0]
    
    let numbersArray = Array(1...50)
    let pointsArray = Array(1...5)
    
    var totalPoints: Int {
        exhibitPoints.reduce(0, +)
    }
    
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
                    .onChange(of: selectedNumber) { newValue in
                        // Always resize arrays to match selection
                        exhibitIDs = Array(repeating: "", count: newValue)
                        exhibitPoints = Array(repeating: 0, count: newValue)
                    }
                }
                
                Section(header: Text("Exhibit #                             Exhibit Points")) {
                    ForEach(0..<exhibitIDs.count, id: \.self) { index in
                        HStack {
                            TextField("Exhibit #", text: $exhibitIDs[index])
                            Picker("Points", selection: $exhibitPoints[index]) {
                                ForEach(pointsArray, id: \.self) { number in
                                    Text(String(number))
                                }
                            }
                            .pickerStyle(.menu)
                        }
                    }
                }
                
                Section(header: Text("TOTAL POINTS")) {
                    Text("Total Points: \(totalPoints)")
                }
            }
        }
        .onAppear {
            // Initialize arrays correctly for default selection
            exhibitIDs = Array(repeating: "", count: selectedNumber)
            exhibitPoints = Array(repeating: 0, count: selectedNumber)
        }
    }
}


#Preview {
    Sweepstakes()
}
