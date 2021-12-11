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
    @StateObject var viewModel = UserViewModel()


    var body: some View {
        
        VStack {
            if status {
                    TabView {
                        FullCardView()
                            .tabItem {
                                Label("", systemImage: "list.dash")
                            }

                        
                        ProfileView()
                            .tabItem {
                                Label("", systemImage: "person.fill")
                            }
                        
                    }
                    .environmentObject(viewModel)
                    .onAppear {
                        viewModel.fetchUsers()
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


