//
//  CurrentUserViewModel.swift
//  Dating2
//
//  Created by Shawn Shirazi on 1/3/22.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseFirestore

class CurrentUserViewModel: ObservableObject {

    @Published var user: User = testUser
    @Published var users = [User]()
    @Published var userSession: FirebaseAuth.User?

    init() {
        //fetchUsers()
        //fetchCurrentUser()
    }
    
    
    func fetchCurrentUser() {
        
        Auth.auth().currentUser?.reload()
        
        userSession = Auth.auth().currentUser
        
        
        guard let uid = userSession?.uid else { return }
        let ref = Database.database().reference()

        ref.child("users").child(uid).observeSingleEvent(of: .value, with: { snapshot in

            let value = snapshot.value as? NSDictionary
            let user = User(dictionary: value as? [String : Any] ?? ["" : ""])
            self.users.append(User(dictionary: value as? [String : Any] ?? ["" : ""]))
            self.user = User(dictionary: value as? [String : Any] ?? ["" : ""])
            
            //print("DEBUG: \(user.name)")
        })
        
    }
    
}

