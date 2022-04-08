//
//  OtherUsersViewModel.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/15/21.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseFirestore

class OtherUsersViewModel: ObservableObject {

    @Published var user: User = testUser
    @Published var users = [User]()
    @Published var userSession: FirebaseAuth.User?

    init() {
        getOtherUsers()
    }
    
    func getOtherUsers() {
        
        //Auth.auth().currentUser?.reload()
        userSession = Auth.auth().currentUser
        let ref = Database.database().reference()
        
        ref.child("users").observe(.childAdded) { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let user = User(dictionary: value as? [String : Any] ?? ["" : ""])
            self.users.append(User(dictionary: value as? [String : Any] ?? ["" : ""]))
            self.user = User(dictionary: value as? [String : Any] ?? ["" : ""])
            
            //print("DEBUG: \(user.name)")

        }
    }
}
