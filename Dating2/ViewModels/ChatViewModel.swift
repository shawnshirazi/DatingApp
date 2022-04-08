//
//  ChatViewModel.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/18/21.
//

import SwiftUI
import Firebase

class ChatViewModel: ObservableObject {
    
    @Published var message: Message = testMessage
    @Published var messages = [Message]()

    
    @Published var userSession: FirebaseAuth.User?
    @Published var user: User = testUser
    @Published var users = [User]()
    
    @Published var uidModel: UIDModel = testuidModel
    @Published var uidModels = [UIDModel]()
    
    @Published var uidModel2: UIDModel2 = testuidModel2
    @Published var uidModels2 = [UIDModel2]()

    @Published var arrayMessages = [Message]()
    
    typealias CompletionHandler = (_ success:Bool) -> Void

    
    init() {
        //fetchMessages { Bool in
            
        //}
        arrayofMessages()
    }
    
    func sendMessages(id: String, messageText: String) {
        Auth.auth().currentUser?.reload()
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let ref = Database.database().reference()

        guard let keyValue = ref.child("messages").childByAutoId().key else { return }
        
        //let receivingRecentRef = ref.child("messages").child()
        
        let data: [String: Any] = ["fromId": uid, "text": messageText, "toId": id, "timestamp": [".sv": "timestamp"]]
        
        ref.child("messages").child(keyValue).setValue(data)
                   
    }
    
    func arrayofMessages() {
        fetchMessages { (hasSucceed) in
            //print("DEBUG: ALL MESSAGES count\(self.arrayMessages.count)")
            self.arrayMessages.sort(by: { $0.timestamp.compare($1.timestamp) == ComparisonResult.orderedAscending})

            //self.arrayMessages.sort(by: { $0.timestamp.compare($1.timestamp) == ComparisonResult.orderedDescending})
            //self.arrayMessages2 = self.arrayMessages
            //self.arrayMessages.sorted(by: { $0.timestamp.compare($1.timestamp) == .orderedAscending })

            //print("DEBUG MESSSSSS \(self.arrayMessages)")
            //for i in self.arrayMessages {
            //    print("DEBUG: ALL MESSAGES \(self.arrayMessages)")
            //}
        }
    }
    
    

    
    func fetchMessages(completion: @escaping (Bool) -> Void) {
    //func fetchMessages() {

        Auth.auth().currentUser?.reload()
        userSession = Auth.auth().currentUser
        guard let uid = userSession?.uid else { return }
        let ref = Database.database().reference()
        
        //ref.child("messages").queryOrdered(byChild: "fromId").queryEqual(toValue: uid).observe(.value, with: { snapshot in
        ref.child("messages").queryOrdered(byChild: "fromId").queryEqual(toValue: uid).observe(.childAdded, with: { snapshot in

            if (snapshot.value is NSNull) {
                print("DEBUG: data not found")
            } else {
                //for message in snapshot.children {
                    //guard let snapshot = message as? DataSnapshot else {
                        //continue
                    //}
                                
                    let value = snapshot.value as? NSDictionary
                    let message = Message(dictionary: value as? [String : Any] ?? ["" : ""])
                    self.messages.append(Message(dictionary: value as? [String : Any] ?? ["" : ""]))
                    self.message = Message(dictionary: value as? [String : Any] ?? ["" : ""])

                    //print("dEBUG: MESSAGES A \(message.text)")
                    //print("DEBUG : FROM ID A \(message.fromId)")
                    //print("DEBUG : TO ID A  \(message.toId)")

                    self.arrayMessages.append(message)
                

            }
            
        })
             
        //ref.child("messages").queryOrdered(byChild: "toId").queryEqual(toValue: uid).observe(.value, with: { snapshot in
        ref.child("messages").queryOrdered(byChild: "toId").queryEqual(toValue: uid).observe(.childAdded, with: { snapshot in

            //for liked in snapshot.children {
                //guard let snapshot = liked as? DataSnapshot else {
                  //  continue
                //}
                                                        
                let value = snapshot.value as? NSDictionary
                let message = Message(dictionary: value as? [String : Any] ?? ["" : ""])
                self.messages.append(Message(dictionary: value as? [String : Any] ?? ["" : ""]))
                self.message = Message(dictionary: value as? [String : Any] ?? ["" : ""])
                
                
                //print("dEBUG: MESSAGES B \(message.text)")

                self.arrayMessages.append(message)
            
                //self.arrayMessages.sort(by: { $0.timestamp.compare($1.timestamp) == ComparisonResult.orderedAscending})
            
            //let sortedArray2 = self.arrayMessages.sorted( by: { ($0.timestamp as! Int) < ($1.timestamp  as! Int)} )
            //print("DEBUG: ARRAy\(self.arrayMessages)")
            
            //let sortedArray = self.arrayMessages.sort { (obj1, obj2) -> Bool in
             //   return (obj1.timestamp < obj2.timestamp)
            //}

                //print("DEBUG: ARRAy\(self.arrayMessages)")
                //self.arrayofMessages()

            
        })
        completion(true)

    }
    
    
}
