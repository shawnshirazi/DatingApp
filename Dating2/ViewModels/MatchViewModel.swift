//
//  MatchViewModel.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/16/21.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseFirestore

class MatchViewModel: ObservableObject {
    
    @Published var likedUser: LikedUser = testLikedUser
    @Published var likedUsers = [LikedUser]()
    @Published var userSession: FirebaseAuth.User?
    @Published var user: User = testUser
    @Published var users = [User]()
    
    @Published var uidModel: UIDModel = testuidModel
    @Published var uidModels = [UIDModel]()
    
    init() {
        fetchMatch()
    }
    
    func fetchMatch() {
        
        Auth.auth().currentUser?.reload()
        userSession = Auth.auth().currentUser
        guard let uid = userSession?.uid else { return }
        let ref = Database.database().reference()
        
        ref.child("likedUsers").queryOrdered(byChild: "uid2").queryEqual(toValue: uid).observe(.value, with: { snapshot in
            if (snapshot.value is NSNull) {
                //print("DEBUG: data not found")
            } else {
                for liked in snapshot.children {
                    guard let snapshot = liked as? DataSnapshot else {
                        continue
                    }
                                
                    let value = snapshot.value as? NSDictionary
                    let likedUser = LikedUser(dictionary: value as? [String : Any] ?? ["" : ""])
                    self.likedUsers.append(LikedUser(dictionary: value as? [String : Any] ?? ["" : ""]))
                    self.likedUser = LikedUser(dictionary: value as? [String : Any] ?? ["" : ""])
                    
                    //print("DEBUG  ALL LIKES by: \(likedUser.uid2)")
                    //print("DEBUG  ALL LIKES : \(likedUser.likedUser)")

                    
                    ref.child("likedUsers").queryOrdered(byChild: "uid2").queryEqual(toValue: likedUser.likedUser).observe(.value, with: { snapshot in
                        
                        for liked in snapshot.children {
                            guard let snapshot = liked as? DataSnapshot else {
                                continue
                            }
                                        
                            
                            let value = snapshot.value as? NSDictionary
                            let uidModel = UIDModel(dictionary: value as? [String : Any] ?? ["" : ""])
                            self.uidModels.append(UIDModel(dictionary: value as? [String : Any] ?? ["" : ""]))
                            self.uidModel = UIDModel(dictionary: value as? [String : Any] ?? ["" : ""])
                            
                            //print("DEBUG likedUser is \(uidModel.likedUser)")
                            //print("DEBUG uid is \(uid)")

                            if uidModel.likedUser == uid {
                            
                                //print("dEBUG: ACTUAL match with \(uidModel.uid2)")
                                
                                ref.child("users").queryOrdered(byChild: "uid").queryEqual(toValue: uidModel.uid2).observeSingleEvent(of: .childAdded, with: { snapshot in
                                    
                                    let value = snapshot.value as? NSDictionary
                                    let user = User(dictionary: value as? [String : Any] ?? ["" : ""])
                                    self.users.append(User(dictionary: value as? [String : Any] ?? ["" : ""]))
                                    self.user = User(dictionary: value as? [String : Any] ?? ["" : ""])
                                    
                                    //print("DEBUG: \(user.name)")
                                })
                                
                            }
                            
                        }

                        
                    })
                    


                }
            }
            
        })
    }
}
