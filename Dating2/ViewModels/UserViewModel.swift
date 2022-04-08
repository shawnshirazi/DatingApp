//
//  UserViewModel.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/27/21.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseFirestore

class UserViewModel: ObservableObject {

    @Published var user: User = testUser
    @Published var users = [User]()
    @Published var userSession: FirebaseAuth.User?
    @Published var likedUser: LikedUser = testLikedUser
    @Published var likedUsers = [LikedUser]()
    @Published var last = -1

    init() {
        //fetchUsers()
        getOtherUsers()
    }
    
    func getOtherUsers() {
        userSession = Auth.auth().currentUser
        let ref = Database.database().reference()
        guard let uid = userSession?.uid else { return }
        
        ref.child("users").observe(.childAdded) { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {

                let userId = snapshot.key
                                
                if uid != userId {
                    print("Debugggg \(userId)")
                    
                    //check all liked records if uid = uid2 and likeduser.likeduser = userId
                    
                    let oValue = snapshot.value as? NSDictionary
                    
                    var x = false
                    
                    ref.child("likedUsers").queryOrdered(byChild: "uid").queryEqual(toValue: uid).observe(.childAdded) { snapshot in
                        //ref.child("likedUsers").queryOrdered(byChild: "user").queryEqual(toValue: userId).observe(.childAdded) { snapshot in
                            let value = snapshot.value as? NSDictionary

                            let likedUser = LikedUser(dictionary: value as? [String : Any] ?? ["" : ""])
                            self.likedUsers.append(LikedUser(dictionary: value as? [String : Any] ?? ["" : ""]))
                            self.likedUser = LikedUser(dictionary: value as? [String : Any] ?? ["" : ""])
                            
                            //print("DEBUGs: \(likedUser.uid2)")
                            print("DEBUG filtered users: \(likedUser.likedUser)")
                        
                            x = true
                        
                        for i in userId {
                            
                        }
                        //}
                    }
                    
                    if x == false {
                                                        
//                        let user = User(dictionary: oValue as? [String : Any] ?? ["" : ""])
//                        self.users.append(User(dictionary: oValue as? [String : Any] ?? ["" : ""]))
//                        self.user = User(dictionary: oValue as? [String : Any] ?? ["" : ""])
                        
                        print("DEBUG new users: ")
                    }

                    
                }

//                if uid != userId {
//                    let value = snapshot.value as? NSDictionary
//                    let user = User(dictionary: value as? [String : Any] ?? ["" : ""])
//                    self.users.append(User(dictionary: value as? [String : Any] ?? ["" : ""]))
//                    self.user = User(dictionary: value as? [String : Any] ?? ["" : ""])
//                }
            }
        }
    }
    
    func frameMaxHeight(id: User, value: CGFloat) {
        
        for i in 0..<self.users.count {
            if self.users[i].id == id.id {
                //self.users[i].maxWidth = value
                self.users[i].maxHeight = value
            }
        }
    }
    
        
    func update(id: User, value: CGFloat, degree: Double) {
        
        for i in 0..<self.users.count {
            if self.users[i].id == id.id {
                self.users[i].swipe = value
                self.users[i].degree = degree
            }
        }
    }
    
    func goBack(index: Int) {
        self.users[index].swipe = 0
    }

    
    //func updateDB(id: User, likes: Int, liked: Int, likedUser: String, date: Date) {
    func updateDB(id: User, user: String, status: Int) {
        
        let ref = Database.database().reference()
        guard let uid = userSession?.uid else { return }

        guard let keyValue = ref.child("likedUsers").childByAutoId().key else { return }
        ref.child("likedUsers").child(keyValue).updateChildValues(["user" : user, "uid" : uid, "status" : status])
    }
    
    func fetchUsers() {
        
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

