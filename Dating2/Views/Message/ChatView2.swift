//
//  ChatView2.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/22/21.
//

import SwiftUI
import Kingfisher

struct ChatView2: View {
    
    let user: User
    @State var messageText: String = ""
    @EnvironmentObject var viewModelMatch: MatchViewModel
    //@EnvironmentObject var viewModelChat: ChatViewModel
    @ObservedObject var viewModelChat = ChatViewModel()
    //let chat: ChatViewModel
    
    //let uid = Auth.auth().currentUser?.uid
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(viewModelChat.arrayMessages, id: \.text) { message in
                        HStack {
                            if message.isFromCurrentUser == true && user.id == message.toId {
                            Spacer()
                            
                            Text(message.text)
                                .padding()
                                .background(Color.blue)
                                .clipShape(ChatBubble(isFromCurrentUser: true))
                                .foregroundColor(.white)
                                .padding(.horizontal)
                                
                                .environmentObject(viewModelChat)

                            } else if message.isFromCurrentUser == false && user.id == message.fromId{
                                HStack(alignment: .bottom) {
                                    
                                    KFImage(URL(string: user.ImageUrl))
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
 
                                    
                                    Text(message.text)
                                        .padding()
                                        .background(Color(.systemGray5))
                                        .clipShape(ChatBubble(isFromCurrentUser: false))
                                        .foregroundColor(.black)
                                    
                                        .environmentObject(viewModelChat)

                                }
                                .padding(.horizontal)

                                Spacer()
                            }
                        }
                    }
            }
            .padding(.top)


        }
            
        MessageView(messageText: $messageText, user: user)
            .padding()
            .environmentObject(viewModelChat)

        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
struct ChatView2_Previews: PreviewProvider {
    static var previews: some View {
        ChatView2()
    }
}
*/
