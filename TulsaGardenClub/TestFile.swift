//
//  TestFile.swift
//  TulsaGardenClub
//
//  Created by AM Student on 12/3/25.
//

import SwiftUI

struct TestFile: View {
    var body: some View {
        Text("My Framed Content")
                   .font(.title)
                   .padding()
                   .frame(width: 250, height: 150)
                   .cornerRadius(20)
                   .background(Color.yellow) // The background of the content
                   .overlay(
                       RoundedRectangle(cornerRadius: 20) // The shape for the outline
                           .stroke(Color.purple, lineWidth: 4) // The outline color and thickness
                   )
            
    }
}

#Preview {
    TestFile()
}
