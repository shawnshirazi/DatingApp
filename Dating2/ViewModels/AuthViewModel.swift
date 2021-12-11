//
//  AuthViewModel.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/27/21.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    
    static let shared = AuthViewModel()
    
    
    func registerUser(email: String, password: String, name: String) {
            
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            
            print("DEBUG: Successfully signes up user")
        }
    }
    
    func userInfo(name: String, gender: String, SO: String, age: String) {
        if let error = error {
            print("Debug: Error \(error.localizedDescription)")
            return
        }
    
        guard let user = Auth.auth().currentUser else { return }
        
        let data = ["name": name,
                    "gender": gender,
                    "SO": SO,
                    "age": age,
                    "uid": user.uid]
        
        Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
            print("DEBUG: uploaded user data")
            
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
}
