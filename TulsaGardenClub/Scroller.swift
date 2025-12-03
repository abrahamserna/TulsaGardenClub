//
//  Scroller.swift
//  TulsaGardenClub
//
//  Created by AM Student on 12/3/25.
//

import SwiftUI

struct Scroller: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.darkgreen)
                        .frame(width: 210, height: 150)
                    Text("11/03/2025")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding()
                }
                
            }
            
            .padding()
        }
    }
}

#Preview {
    Scroller()
}
