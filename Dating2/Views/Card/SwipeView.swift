//
//  SwipeView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/28/21.
//

import SwiftUI
import Firebase

struct SwipeView: View {
    
    @ObservedObject var viewModel = UserViewModel()
    
    init() {
        viewModel.getOtherUsers()
    }
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                
                ForEach(self.viewModel.users) { i in
                        
                    SwipeDetailView(name: i.name, age: i.age, image: i.ImageUrl)
                        .gesture(DragGesture()
                                    .onChanged({ (value) in
                                        
                                        if value.translation.width > 0 {
                                            self.viewModel.update(id: i, value: value.translation.width, degree: 8)
                                        } else {
                                            self.viewModel.update(id: i, value: value.translation.width, degree: -8)
                                        }
                                        
                                    }).onEnded({ (value) in
                                        
                                        if i.swipe > 0 {
                                            if i.swipe > geo.size.width / 2 - 80 {
                                                //liked
                                                self.viewModel.update(id: i, value: 500, degree: 0)
                                                self.viewModel.updateDB(id: i, likes: i.likes + 1, liked: self.viewModel.user.liked + 1, likedS: i.uid)
                                                self.viewModel.likedUID(id: i, likedS: i.uid)

                                                
                                            } else {
                                                self.viewModel.update(id: i, value: 0, degree: 0)
                                            }
                                        } else {
                                            if -i.swipe > geo.size.width / 2 - 80 {
                                                //reject
                                                self.viewModel.update(id: i, value: -500, degree: 0)
                                                //self.viewModel.updateDB2(id: i, status: "reject", likes: -1)

                                            } else {
                                                self.viewModel.update(id: i, value: 0, degree: 0)
                                            }                                        }
                                    })
                        
                        )
                        .offset(x: i.swipe)
                        .rotationEffect(.init(degrees: i.degree))
                        .animation(.spring())
                    
    

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


