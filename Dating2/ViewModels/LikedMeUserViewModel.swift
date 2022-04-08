//
//  LikedMeUserViewModel.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/14/21.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseFirestore

class LikedMeUserViewModel: ObservableObject {
    
    @Published var likedUser: LikedUser = testLikedUser
    @Published var likedUsers = [LikedUser]()
    @Published var userSession: FirebaseAuth.User?
    @Published var user: User = testUser
    @Published var users = [User]()
    
    @Published var uidModel: UIDModel = testuidModel
    @Published var uidModels = [UIDModel]()
    
    init() {
        fetchLikedMeUsers()
    }
    
    func fetchLikedMeUsers() {
        
        Auth.auth().currentUser?.reload()
        userSession = Auth.auth().currentUser
        guard let uid = userSession?.uid else { return }
        let ref = Database.database().reference()
        
        ref.child("likedUsers").observeSingleEvent(of: .value, with: { snapshot in
            for liked in snapshot.children {
                guard let snapshot = liked as? DataSnapshot else {
                    continue
                }
                
                let id = snapshot.key

                ref.child("likedUsers").child(id).observe(.value, with: { snapshot in
                    
                    if (snapshot.value is NSNull) {
                        //print("DEBUG: data not found")
                    } else {
                        let value = snapshot.value as? NSDictionary

                        let likedUser = LikedUser(dictionary: value as? [String : Any] ?? ["" : ""])
                        self.likedUsers.append(LikedUser(dictionary: value as? [String : Any] ?? ["" : ""]))
                        self.likedUser = LikedUser(dictionary: value as? [String : Any] ?? ["" : ""])
                        
                        //print("DEBUGs: \(likedUser.uid2)")
                
                        if uid == likedUser.likedUser {
                            ref.child("users").queryOrdered(byChild: "uid").queryEqual(toValue: likedUser.uid2).observeSingleEvent(of: .childAdded, with: { snapshot in

                            let value = snapshot.value as? NSDictionary
                            let user = User(dictionary: value as? [String : Any] ?? ["" : ""])
                            self.users.append(User(dictionary: value as? [String : Any] ?? ["" : ""]))
                            self.user = User(dictionary: value as? [String : Any] ?? ["" : ""])
                            
                            //print("DEBUGttt: \(user.name)")
                            //print("DEBUGttt: \(user.age)")
                            })
                        }
                    }
                })
            }
        })
    }
}
