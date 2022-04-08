//
//  DiscoverView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/30/21.
//

import SwiftUI
import Kingfisher

struct DiscoverDetailView: View {
    
    var name = "Shawn"
    var age = "22"
    var image = "https://picsum.photos/400"
    //var image2 = "https://picsum.photos/401"
    var images: [URL] = [URL(string: "https://picsum.photos/400")!, URL(string: "https://picsum.photos/401")!, URL(string: "https://picsum.photos/402")!]

    @State private var imageIndex = 0
    
    @State var showSheet: User?
    let user: User
    
    func updateImageIndex(addition: Bool) {
        let newIndex: Int
        
        if addition {
            newIndex = imageIndex + 1
        } else {
            newIndex = imageIndex - 1
        }
        
        imageIndex = min(max(0, newIndex), images.count - 1)
    }
    
    var body: some View {
        
//        GeometryReader { geo in
//            ZStack {
//                ZStack {
//
//                    KFImage(URL(string: image))
//                        .resizable()
//
////                    KFImage(images[imageIndex])
////                        .placeholder {
////                            Color.white
////                        }
////                        .resizable()
////                        .aspectRatio(contentMode: .fill)
////                        .frame(width: geo.size.width, height: geo.size.height)
////                        .clipped()
//
//                    HStack {
//                        Rectangle()
//                            .onTapGesture(perform: {
//                                updateImageIndex(addition: false)
//                            })
//
//                        Rectangle()
//                            .onTapGesture(perform: {
//                                updateImageIndex(addition: true)
//                            })
//
//                    }
//                    .foregroundColor(Color.white.opacity(0.01))
//
//                    VStack {
//                        Spacer()
//
//                        HStack {
//                            UserFirstCardInfo(name: name, age: age)
//                                .padding(.horizontal,5)
//
//                            Image(systemName: "info.circle")
//                                .resizable()
//                                .imageScale(.large)
//                                .frame(width: 25, height: 25)
//                                .padding()
//                        }
//                        .contentShape(Rectangle())
//                        .frame(width: geo.size.width)
//                        .onTapGesture { self.showSheet = user }
//                        .foregroundColor(.white)
//
//                    }
//
//                }
//
//                VStack {
//                    HStack {
//                        ForEach(0..<images.count) { imageIndex in
//                            RoundedRectangle(cornerRadius: 20)
//                                .frame(height: 4)
//                                .foregroundColor(self.imageIndex == imageIndex ? Color.white : Color.gray.opacity(0.5))
//                        }
//                    }
//                    .padding(.top, 6)
//                    .padding(.horizontal, 12)
//
//                    Spacer()
//
//                }
//
//
//
//            }
//            .sheet(item: self.$showSheet) { item in
//                UserProfileView(user: item, name: item.name, age: item.age, images: item.urlImages)
//            }
//        }
        
        ZStack() {
            KFImage(URL(string: image))
                .resizable()

            
            VStack {
                Spacer()
                
                UserFirstCardInfo(name: name, age: age)
                    .foregroundColor(.white)
                    .padding(.horizontal,5)
            }
        


        }
    }
}
/*
struct DiscoverDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DiscoverDetailView()
        }
    }
}*/




