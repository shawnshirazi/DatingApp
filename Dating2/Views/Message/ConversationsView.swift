//
//  ConversationsView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/19/21.
//

import SwiftUI
import Kingfisher

struct ConversationsView: View {
    
    @EnvironmentObject var viewModelMatch: MatchViewModel
    //@EnvironmentObject var viewModelChat: ChatViewModel
    @ObservedObject var viewModelChat = ChatViewModel()

    
    var body: some View {
            ZStack {
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(self.viewModelMatch.users) {user in
                            NavigationLink(destination: LazyView(ChatView2(user: user))) {
                            //NavigationLink(destination: LazyView(ChatView(user: viewModelChat.user))) {
                                HStack(spacing: 15) {
                                    KFImage(URL(string: user.ImageUrl))
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text(user.name)
                                        
                                        Text(viewModelChat.message.text)
                                        
                                        Divider()
                                    }
                                }
                                .padding()
                                .foregroundColor(.black)
                            }
                        }
                    }

                }
            }
            .navigationBarHidden(true)

    }
}

/*
struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
*/
