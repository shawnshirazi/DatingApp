//
//  ContentView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/27/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    //@EnvironmentObject var viewModel: AuthViewModel
    //@ObservedObject var viewModel = UserViewModel()
    @StateObject var viewModel = UserViewModel()
    @StateObject var viewModelLiked = likedUserViewModel()
    @StateObject var viewModelLikedMe = LikedMeUserViewModel()
    @StateObject var viewModelMatch = MatchViewModel()
    @StateObject var viewModelChat = ChatViewModel()

    //@StateObject var otherViewModel = OtherUsersViewModel()



    var body: some View {
        
        VStack {
            if status {
                NavigationView {
                    TabView {
                        
                        FullCardView()
                            .tabItem {
                                Label("", systemImage: "list.dash")
                            }
                            //.onAppear { viewModel.getOtherUsers() }

                        /*
                        LikedView()
                            .tabItem {
                                Label("Likes", systemImage: "list.dash")
                            }*/
                        
                        LikedMeView()
                            .tabItem {
                                Label("Liked Me", systemImage: "list.dash")
                            }
                        
                        ConversationsView()
                            .tabItem {
                                Label("Matches", systemImage: "list.dash")
                            }
                        
                        ProfileView()
                            .tabItem {
                                Label("", systemImage: "person.fill")
                            }
                        
                    }
                    .environmentObject(viewModel)
                    .environmentObject(viewModelLiked)
                    .environmentObject(viewModelLikedMe)
                    .environmentObject(viewModelMatch)
                    .environmentObject(viewModelChat)
                    
                    //.onAppear { otherViewModel.getOtherUsers() }
                }
            } else {
                NavigationView {
                    PhoneAuthView()
                }
            }
        }
        
        .onAppear {
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) {
                (_) in
                
                let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                
                self.status = status
            }
            
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


