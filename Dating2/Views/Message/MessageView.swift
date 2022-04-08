//
//  MessageView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/18/21.
//

import SwiftUI

struct MessageView: View {
    
    @Binding var messageText: String
    @EnvironmentObject var viewModelChat: ChatViewModel
    let user: User
    
    //var action: () -> Void

    var body: some View {
        HStack {
            TextField("Message...", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            
            /*
            Button(action: viewModelChat.sendMessages(id: user.id, $messageText)) { 
                Text("Send")
                    .bold()
                    .foregroundColor(.blue)
            }*/
            
            Button(action: {
                viewModelChat.sendMessages(id: user.id, messageText: messageText)
            }, label: {
                Text("Send")
                    .bold()
                    .foregroundColor(.blue)
            })
        }
    }
}


/*
struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}*/
