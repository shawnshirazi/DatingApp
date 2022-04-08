//
//  SwipeView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/28/21.
//

import SwiftUI
import Firebase

struct SwipeView: View {
    
    @EnvironmentObject var viewModel: UserViewModel
    @ObservedObject var otherViewModel = OtherUsersViewModel()
    @State var didAppear = false
    @State var appearCount = 0
        
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                ForEach(viewModel.users) { i in
                    ZStack {
                        if i.ImageUrl2 == "" {
                            SwipeDetailView(name: i.name, age: i.age, image: i.ImageUrl)

                        } else if i.ImageUrl3 == "" {
                            SwipeDetailView2(name: i.name, age: i.age, image: i.ImageUrl, image2: i.ImageUrl2)
                        }
                        else if i.ImageUrl4 == "" {
                            SwipeDetailView3(name: i.name, age: i.age, image: i.ImageUrl, image2: i.ImageUrl2, image3: i.ImageUrl3)
                        }
                    }/*
                    .gesture(DragGesture()
                                .onChanged({ (value) in
                                    if value.translation.width > 0 {
                                        self.viewModel.update(id: i, value: value.translation.width, degree: 8)
                                    } else {
                                        self.viewModel.update(id: i, value: value.translation.width, degree: -8)
                                    }
                                }) .onEnded({ (value) in
                                    if i.swipe > 0 {
                                        if i.swipe > geo.size.width / 2 - 80 {
                                            self.viewModel.update(id: i, value: 500, degree: 0)
                                            self.viewModel.updateDB(id: i, likedUser: i.uid)

                                            
                                        } else {
                                            self.viewModel.update(id: i, value: 0, degree: 0)
                                        }
                                    } else {
                                        if -i.swipe > geo.size.width / 2 - 80 {
                                            //reject
                                            self.viewModel.update(id: i, value: -500, degree: 0)

                                        } else {
                                            self.viewModel.update(id: i, value: 0, degree: 0)
                                        }
                                    }
                                })
                    )
                    .offset(x: i.swipe)
                    .animation(.spring())*/
                }

            }

        }
    }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}


