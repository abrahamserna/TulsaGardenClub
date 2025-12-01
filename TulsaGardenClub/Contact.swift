//
//  Contact.swift
//  TulsaGardenClub
//
//  Created by AM Student on 12/1/25.
//

import SwiftUI

struct Contact: View {
    var body: some View {
        HStack {
            Image(systemName: "envelope")
            
            Text("Contact")
        }
        .padding(50)
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "mail")
                Text("Email: support@tulsagardenclub.app")
                   
            }
            .padding(1)
            HStack {
                Image(systemName: "phone")
                Text("Phone: (918) 555-1212")
            }
            .padding(1)
            HStack {
                Image(systemName: "globe")
                Text("Social Media: Facebook | Instagram | X")
            }
            .padding(1)
            HStack {
                Image(systemName: "pin")
                Text("Address: 12345 Garden Club Blvd, Tulsa, OK 74135")
                    .font(.caption)
            }
            
        }
        
    }
}

#Preview {
    Contact()
}
