//
//  DiscoView2.swift
//  Dating2
//
//  Created by Shawn Shirazi on 1/1/22.
//

import SwiftUI
import UIKit
import Firebase

struct DiscoView2: View {
    
    @EnvironmentObject var viewModel: UserViewModel
    //@ObservedObject var otherViewModel = OtherUsersViewModel()
    @State var height: CGFloat = 400
    @State private var test: Bool = true

    @State var showSheet: User?
    
    
    var body: some View {
        GeometryReader { geo in
                        
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                        ForEach(viewModel.users) { i in
                            
                            var x = geo.size.height / 1.2
                                //LazyVStack(spacing: 0) {
                                //VStack(spacing: 0) {
                                    DiscoverDetailView(name: i.name, age: i.age, image: i.ImageUrl, user: i)
                                //DiscoverDetailView(name: i.name, age: i.age, images: i.urlImages)
                                        //.frame(width: geo.size.width, height: x)

                                    
                                    //}
                                    //.sheet(item: self.$showSheet) { item in
                                      //  UserProfileView(user: item, name: item.name, age: item.age, images: item.urlImages)
                                    //}
                                    .gesture(DragGesture()
                                                .onChanged({ (value) in
                                                    if value.translation.width > 0 {
                                                        self.viewModel.update(id: i, value: value.translation.width, degree: 3)
                                                        //self.viewModel.frameMaxHeight(id: i, value: geo.size.height)
                                                        //i.maxHeight = geo.size.height
                                                    } else {
                                                        self.viewModel.update(id: i, value: value.translation.width, degree: -3)
                                                        //self.viewModel.frameMaxHeight(id: i, value: geo.size.height)
                                                    }
                                                }) .onEnded({ (value) in
                                                    if i.swipe > 0 {
                                                        if i.swipe > geo.size.width - 280 {
                                                            //like
                                                            self.viewModel.update(id: i, value: 500, degree: 0)
                                                            self.viewModel.updateDB(id: i, user: i.uid, status: 1)
                                                            self.viewModel.frameMaxHeight(id: i, value: 0)
                                                            test = false
                                                            
                                                        } else {
                                                            self.viewModel.update(id: i, value: 0, degree: 0)
                                                        }
                                                    } else {
                                                        if -i.swipe > geo.size.width - 280 {
                                                            //reject
                                                            self.viewModel.update(id: i, value: -500, degree: 0)
                                                            self.viewModel.updateDB(id: i, user: i.uid, status: 0)
                                                            self.viewModel.frameMaxHeight(id: i, value: 0)
                                                            test = false
                                                            
                                                        } else {
                                                            self.viewModel.update(id: i, value: 0, degree: 0)
                                                        }
                                                    }
                                                })
                                    )
                                    .offset(x: i.swipe)
                                    .rotationEffect(.init(degrees: i.degree))
                                    .animation(.spring())
                                    .frame(height: i.maxHeight)
                                    //.frame(height: test ? x : i.maxHeight)
                            //}
                                    .buttonStyle(FlatLinkStyle())


                    }

                }
                
            }
        }
    }
    

}

struct DiscoView2_Previews: PreviewProvider {
    static var previews: some View {
        DiscoView2()
    }
}


//NAVIGATION LINK FLASH
struct FlatLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}



