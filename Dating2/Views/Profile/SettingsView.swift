//
//  SettingsView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/27/21.
//

import SwiftUI
import Firebase

struct SettingsView: View {
    var body: some View {
        Form {
            Section(header: Text("Account Settings"), footer: Text("Verify your Phone Number and Email to help secure your account.")) {
                HStack {
                    Text("Phone Number")
                    
                    Spacer()
                    
                    Text("+1 949 887 4810")
                }
                HStack {
                    Text("Email")
                    
                    Spacer()
                    
                    Text("shawn_shirazi@yahoo.com")
                }
                
            }
            
            Button(action: {
                
                try? Auth.auth().signOut()
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)

                
            }, label: {
                Text("Sign out")
                    .font(.title)
                    .frame(width: 150, height: 50)
            })
            .foregroundColor(.white)
            .background(Color.orange)
            .cornerRadius(10)

        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

