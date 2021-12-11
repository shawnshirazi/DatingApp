//
//  UserViewModel.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/27/21.
//

import SwiftUI
import Firebase
import FirebaseDatabase

class UserViewModel: ObservableObject {
        

    @Published var user: User = testUser
    @Published var users = [User]()
    @Published var userSession: FirebaseAuth.User?
    @Published var last = -1
    
    //let currentUser: String = (Auth.auth().currentUser?.uid)!


    init() {
        fetchUsers()
    }
    
    func getOtherUsers() {
        Firestore.firestore().collection("users").getDocuments { snapshot, error in
            
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.users = snapshot.documents.map { d in
                            return User(dictionary: d.data())
                        }
                    }
                    
                }
            }
        }
    }
        
    
    func getOtherUsers2() {
        
        Firestore.firestore().collection("users").getDocuments { snapshot, error in
            
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        
                        //let users = self.user.id != self.currentUser
                        
                        //if users {
                            if self.user.status == "" {
                                self.users = snapshot.documents.map { d in
                                     return User(dictionary: d.data())
                                }
                            }
                        //}
                    }
                }
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
    
    /*
    func updateDB2(id: User, status: String, likes: Int) {
        
        let db = Firestore.firestore()
                
        db.collection("users").document(id.id).updateData(["status": status, "likes": likes] ) { (err) in
            
            if err != nil {
                print(err)
                return
            }
                        
            for i in 0..<self.users.count {
                
                if self.users[i].id == id.id {
                    
                    if status == "liked" {
                        self.users[i].swipe = 500
                        self.user.likes+=1
                    }
                    else {
                        self.users[i].swipe = -500
                    }
                }
            }
        }
        
    }*/
    
    func updateLiked(id: User, liked: Int) {
        
        let db = Firestore.firestore()
        
        guard let uid = userSession?.uid else { return }
        
        db.collection("users").document(uid).setData(["liked": liked] ) { (err) in

            if err != nil {
                print(err)
                return
            }
        }
    }
    
    func likedUID(id: User, likedS: String) {
        
        let db = Firestore.firestore()
        let ref = Database.database().reference()
        
        guard let uid = userSession?.uid else { return }

        db.collection("users").document(uid).updateData(["liked UID": likedS] ) { (err) in

            if err != nil {
                print(err)
                return
            }
        }
                
        ref.child("users").child(uid).childByAutoId().setValue(["liked UID": likedS])
    
    }
    
    func updateDB(id: User, likes: Int, liked: Int, likedS: String) {
        
        let db = Firestore.firestore()
        let ref = Database.database().reference()
        
        guard let uid = userSession?.uid else { return }

        db.collection("users").document(id.id).updateData(["likes": likes] ) { (err) in
            db.collection("users").document(uid).updateData(["liked": liked] ) { (err) in
                //db.collection("users").document(uid).updateData(["liked UID": likedS] ) { (err) in
                    
                //ref.child("users").child(uid).updateChildValues(["liked UID": likedS])
                
                    let data = ["liked UID": likedS]
                                    
                    if err != nil {
                        print(err)
                        return
                    }
                                
                    for i in 0..<self.users.count {
                        
                        if self.users[i].id == id.id {
                            
                            if likedS == "liked"{
                                self.users[i].swipe = 500

                            }
                        }
                            
                            /*
                            else {
                                self.users[i].swipe = -500
                            }*/
                    
                    }
                //}
            }
        }
    }
    
    func fetchUsers() {
        
        Auth.auth().currentUser?.reload()
        
        userSession = Auth.auth().currentUser
        
        
        guard let uid = userSession?.uid else { return }
        
        
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else { return }
            let user = User(dictionary: data)
                        
            self.users.append(User(dictionary: data))

            /*
            print("DEBUG \(user)")
            print("DEBUG: \(user.name)")
            print("DEBUG: \(user.ImageUrl)")
        */
            
            
            self.user = User(dictionary: data)
            
        }
        
    }
}

