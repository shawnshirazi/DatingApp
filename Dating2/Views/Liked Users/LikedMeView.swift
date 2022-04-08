//
//  LikedMeView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/14/21.
//

import SwiftUI
import Kingfisher

struct LikedMeView: View {
    
    @EnvironmentObject var viewModelLikedMe: LikedMeUserViewModel
    @EnvironmentObject var viewModel: UserViewModel
    @State var didAppear = false
    @State var appearCount = 0
    
    @State private var showingSheet = false
    @State var showSheet: User?
    
    var body: some View {
        /*
        ScrollView(.vertical) {
            ForEach(self.viewModelLikedMe.users) {i in
                
                LikedMeDetailView(name: i.name, age: i.age, image: i.ImageUrl)

            }
        }*/
        
        /*
        VStack {
            //LikedNavBar()
                //.padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                //if user is not subscribed - unlock gold to view likes

                
                LazyVGrid(
                    columns: [GridItem(.flexible()), GridItem(.flexible())],
                    alignment: .center,
                    spacing: nil,
                    pinnedViews: [],
                    content: {
                        ForEach(self.viewModelLikedMe.users) {i in
                            
                            LikedMeDetailView(name: i.name, age: i.age, image: i.ImageUrl)

                        }
                })
                .padding(.horizontal, 6)
            }
            //.navigationBarHidden(true)
        }*/
        
        
        GeometryReader { geo in
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], pinnedViews: [], content: {
                        ForEach(viewModelLikedMe.users) {i in
                            
                            VStack(spacing: 0) {
                                LikedMeDetailView(name: i.name, age: i.age, image: i.ImageUrl)
                                    .onTapGesture {
                                        self.showSheet = i
                                    }
                            }
                            .sheet(item: self.$showSheet) { item in
                                //UserProfileView(name: item.name, image: item.ImageUrl, image2: item.ImageUrl2, age: item.age)
                                UserProfileView(user: item, name: item.name, age: item.age, images: item.urlImages)
                            }
                            
                            
                        }
                        
                    }).padding(.horizontal, 6)

                }
            }
        }
 
        
    }
    
    func onLoad() {
        if !didAppear {
            appearCount += 1
            viewModelLikedMe.fetchLikedMeUsers()
        }
        didAppear = true
    }
}

struct LikedMeView_Previews: PreviewProvider {
    static var previews: some View {
        LikedMeView()
    }
}
