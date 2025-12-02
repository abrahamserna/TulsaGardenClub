//
//  Contact.swift
//  TulsaGardenClub
//
//  Created by AM Student on 12/1/25.
//

import SwiftUI

struct Contact: View {
    var body: some View {
    
     
            Text("Contact Us")
                .font(.title)
                .position(x: 150, y: 0)
        
        .padding(50)
        ZStack {
            Rectangle()
                .fill(Color.white2)
                .frame(width: 340, height: 240)
                .cornerRadius(35)
                .shadow(radius: 5)
            Rectangle()
                .fill(Color.white1)
                .frame(width: 330, height: 230)
                .cornerRadius(30)
            Rectangle()
                .fill(Color.darkgreen)
                .frame(width: 320, height: 220)
                .cornerRadius(25)
            Rectangle()
                .fill(Color.mediumgreen)
                .frame(width: 310, height: 210)
                .cornerRadius(20)
            Rectangle()
                .fill(Color.lightgreen)
                .frame(width: 300, height: 200)
                .cornerRadius(15)
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "envelope")
                    Text("TulsaGardenGlub@gmail.com")
                    
                }
                .padding(1)
                HStack {
                    Image(systemName: "phone")
                    Text("(918) 625-1161")
                }
                .padding(1)
                HStack {
                    Image(systemName: "smartphone")
                    Text("Facebook | Instagram | X")
                }
                .padding(1)
                HStack {
                    Image(systemName: "pin")
                    Text("PO Box 521003, Tulsa, OK 74152-1003")
                        .font(.caption)
                }
                
            }
        }
            .position(x: 200, y: -100)
        }
    }


#Preview {
    Contact()
}
