//
//  ChatBubble.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/19/21.
//

import SwiftUI

struct ChatBubble: Shape {
    
    var isFromCurrentUser: Bool
    //@EnvironmentObject var viewModelChat: ChatViewModel


    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, isFromCurrentUser ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}


