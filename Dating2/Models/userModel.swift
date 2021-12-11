//
//  userModel.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/27/21.
//

import Firebase
import SwiftUI
import Kingfisher


struct User: Identifiable {
    
    let id: String
    let name: String
    let age: String
    let ImageUrl: String
    let ImageUrl2: String
    let ImageUrl3: String
    let ImageUrl4: String
    let ImageUrl5: String
    let ImageUrl6: String
    
    var swipe: CGFloat
    var degree: Double
    
    var status: String
    var likes: Int
    var liked: Int
    var likedS: String



    let uid: String
    
    
    
    init(dictionary: [String: Any]) {
        
        self.id = dictionary["uid"] as? String ?? ""
        self.name = dictionary["name"] as? String ?? ""
        self.age = dictionary["age"] as? String ?? ""
        self.ImageUrl = dictionary["ImageUrl"] as? String ?? ""
        self.ImageUrl2 = dictionary["ImageUrl2"] as? String ?? ""
        self.ImageUrl3 = dictionary["ImageUrl3"] as? String ?? ""
        self.ImageUrl4 = dictionary["ImageUrl4"] as? String ?? ""
        self.ImageUrl5 = dictionary["ImageUrl5"] as? String ?? ""
        self.ImageUrl6 = dictionary["ImageUrl6"] as? String ?? ""
        self.swipe = dictionary["swipe"] as? CGFloat ?? 0
        self.degree = dictionary["degree"] as? Double ?? 0
        self.status = dictionary["status"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.liked = dictionary["liked"] as? Int ?? 0
        self.likedS = dictionary["likedS"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""

    }
}

let testUser = User(dictionary: ["name": "Shawn"])
