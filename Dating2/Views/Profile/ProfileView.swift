//
//  ProfileView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/27/21.
//

import SwiftUI
import Firebase

struct ProfileView: View {
    
    @ObservedObject var viewModel = UserViewModel()
    
    var body: some View {
        
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    .padding()
                    .offset(x: 150, y: -5)
                    
                    userHeaderView()
                    

                    Superlike_BoostsView()
                    
                    Text("Upgrade")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .frame(width: 350, height: 100)
                        .background(Color.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .circular))
                        .padding()
                    
                    Spacer()
                    
                    Text("Learn more about safety")
                    
                    
                    
                }
                .navigationBarHidden(true)
            }
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(UserViewModel())
    }
}

