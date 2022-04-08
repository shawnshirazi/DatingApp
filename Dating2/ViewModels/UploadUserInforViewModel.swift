//
//  UploadUserInforViewModel.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/27/21.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseFirestore

class UploadUserInfoViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?

        
    func uploadInfo(name: String, gender: String, SO: String, age: String) {
        
        guard let user = Auth.auth().currentUser else { return }
        let ref = Database.database().reference()
        
        let data: [String: Any] = ["name": name,
                                   "gender": gender,
                                   "SO": SO,
                                   "age": age,
                                   "uid": user.uid]
        
        ref.child("users").child(user.uid).updateChildValues(data)
        
        /*
        Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
            print("DEBUG: uploaded user data")
        }*/
                
    }
    
    func uploadNumber(number: String) {
        
        guard let user = Auth.auth().currentUser else { return }
        let ref = Database.database().reference()
        
        let data: [String: Any] = ["phone-number": number]
        
        ref.child("users").child(user.uid).setValue(data)
    }
    
    
    func uploadImage(image: UIImage) {
        
        guard let user = Auth.auth().currentUser else { return }
        let ref = Database.database().reference()

        
        guard let imageData = image.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            storageRef.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                
                let data = ["ImageUrl": imageUrl]

                ref.child("users").child(user.uid).updateChildValues(data)
                /*
                Firestore.firestore().collection("users").document(user.uid).updateData(data) { _ in
                    print("DEBUG: uploaded user image")
                }*/
            }
                        
        }
        
    }
    
    func uploadImage2(image: UIImage) {
        
        guard let user = Auth.auth().currentUser else { return }
        let ref = Database.database().reference()

        
        guard let imageData = image.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            storageRef.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                
                let data = ["ImageUrl2": imageUrl]

                ref.child("users").child(user.uid).updateChildValues(data)
                /*
                Firestore.firestore().collection("users").document(user.uid).updateData(data) { _ in
                    print("DEBUG: uploaded user image")
                }*/
            }
                        
        }
    }
    
    func uploadImage3(image: UIImage) {
        
        guard let user = Auth.auth().currentUser else { return }
        let ref = Database.database().reference()

        
        guard let imageData = image.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            storageRef.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                
                let data = ["ImageUrl3": imageUrl]

                ref.child("users").child(user.uid).updateChildValues(data)
                /*
                Firestore.firestore().collection("users").document(user.uid).updateData(data) { _ in
                    print("DEBUG: uploaded user image")
                }*/
            }
                        
        }
    }
    
    func uploadImage4(image: UIImage) {
        
        guard let user = Auth.auth().currentUser else { return }
        let ref = Database.database().reference()

        
        guard let imageData = image.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            storageRef.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                
                let data = ["ImageUrl4": imageUrl]

                ref.child("users").child(user.uid).updateChildValues(data)
                /*
                Firestore.firestore().collection("users").document(user.uid).updateData(data) { _ in
                    print("DEBUG: uploaded user image")
                }*/
            }
                        
        }
    }
    
    func uploadImage5(image: UIImage) {
        
        guard let user = Auth.auth().currentUser else { return }
        let ref = Database.database().reference()

        
        guard let imageData = image.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            storageRef.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                
                let data = ["ImageUrl5": imageUrl]

                ref.child("users").child(user.uid).updateChildValues(data)
                /*
                Firestore.firestore().collection("users").document(user.uid).updateData(data) { _ in
                    print("DEBUG: uploaded user image")
                }*/
            }
                        
        }
    }
    
    func uploadImage6(image: UIImage) {
        
        guard let user = Auth.auth().currentUser else { return }
        let ref = Database.database().reference()

        
        guard let imageData = image.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            storageRef.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                
                let data = ["ImageUrl6": imageUrl]

                ref.child("users").child(user.uid).updateChildValues(data)
                /*
                Firestore.firestore().collection("users").document(user.uid).updateData(data) { _ in
                    print("DEBUG: uploaded user image")
                }*/
            }
                        
        }
    }
}

