//
//  DiscoverView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/30/21.
//
/*
import SwiftUI
import UIKit
import Firebase

struct DiscoverView: View {
    
    @EnvironmentObject var viewModel: UserViewModel
    @ObservedObject var otherViewModel = OtherUsersViewModel()
    @State var height: CGFloat = 400
    @State private var uid = Auth.auth().currentUser?.uid
    
    /*
    @State private var y: CGFloat
    @State private var test: Bool = false

    func heightssss() -> CGFloat  {
        //let y = CGFloat()
        y = 200
        
        return y
        
    }*/
    
    var body: some View {
                
        GeometryReader { geo in
            
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    ForEach(viewModel.users) { i in
                        
                        //var x = geo.size.height / 1.2
                        
                            NavigationLink(
                                destination: //UserProfileView(name: i.name, image: i.ImageUrl, image2: i.ImageUrl2),
                                UserProfileView(name: i.name, age: i.age, images: i.ImageUrls),

                                        label: {
                                            LazyVStack(spacing: 0) {
                                                
                                                DiscoverDetailView(name: i.name, age: i.age, image: i.ImageUrl)
                                                    .frame(width: geo.size.width, height: geo.size.height / 1.2)

                                                Divider()
                                            }
                                            .gesture(DragGesture()
                                                        .onChanged({ (value) in
                                                            if value.translation.width > 0 {
                                                                self.viewModel.update(id: i, value: value.translation.width, degree: 8)
                                                                //self.viewModel.frameMaxHeight(id: i, value: geo.size.height)
                                                            } else {
                                                                self.viewModel.update(id: i, value: value.translation.width, degree: -8)
                                                                //self.viewModel.frameMaxHeight(id: i, value: geo.size.height)
                                                                //viewModel.user.maxHeight = x
                                                            }
                                                        }) .onEnded({ (value) in
                                                            if i.swipe > 0 {
                                                                if i.swipe > geo.size.width / 2 - 80 {
                                                                    //like
                                                                    self.viewModel.update(id: i, value: 500, degree: 0)
                                                                    self.viewModel.updateDB(id: i, likedUser: i.uid)
                                                                    self.viewModel.frameMaxHeight(id: i, value: 0)
                                                                    //test.toggle()
                                                                } else {
                                                                    self.viewModel.update(id: i, value: 0, degree: 0)
                                                                }
                                                            } else {
                                                                if -i.swipe > geo.size.width / 2 - 80 {
                                                                    //reject
                                                                    self.viewModel.update(id: i, value: -500, degree: 0)
                                                                    self.viewModel.frameMaxHeight(id: i, value: 0)
                                                                    //test.toggle()
                                                                    
                                                                } else {
                                                                    self.viewModel.update(id: i, value: 0, degree: 0)
                                                                }
                                                            }
                                                        })
                                            )
                                            .offset(x: i.swipe)
                                            .animation(.spring())
                                          //  .frame(height: test ? 200 : 400)
                                            .frame(height: 50)


                                        })
                                        .foregroundColor(.black)
                                        .buttonStyle(FlatLinkStyle())



                    }

                }
                
            }
        }
    }
    

}

/*
struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}*/


//NAVIGATION LINK FLASH
struct FlatLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

//Scroll / Frame
func useProxy(_ proxy: GeometryProxy) -> some View {
  //var width = proxy.size.width
    //var height = proxy.size.height / 1.2
  return VStack {
    // use width in here
  }
}

*/
