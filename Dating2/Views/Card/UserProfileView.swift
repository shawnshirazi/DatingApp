//
//  UserProfileView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/30/21.
//

import SwiftUI
import Kingfisher

struct UserProfileView: View {
    let user: User
    var name: String = "Shawn"
    //var image: String = "https://picsum.photos/400"
    //var image2: String  = "https://picsum.photos/401"
    var age: String  = "22"
    
    var images: [URL] = [URL(string: "https://picsum.photos/400")!, URL(string: "https://picsum.photos/401")!, URL(string: "https://picsum.photos/402")!]
    
    var images2: [String] = ["https://picsum.photos/400", "https://picsum.photos/401"]

    @State private var imageIndex = 0
    
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
        GeometryReader { geo in
            
            ZStack {
                ScrollView(showsIndicators: false) {
                    
                    ZStack {
                        ZStack {
                            KFImage(images[imageIndex])
                                .placeholder {
                                    Color.white
                                }
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geo.size.width, height: geo.size.height / 1.6)
                                .clipped()
                            
                            HStack {
                                Rectangle()
                                    .onTapGesture(perform: {
                                        updateImageIndex(addition: false)
                                    })
                                    
                                Rectangle()
                                    .onTapGesture(perform: {
                                        updateImageIndex(addition: true)
                                    })

                            }
                            .foregroundColor(Color.white.opacity(0.01))
                        }
                        
                        VStack {
                            HStack {
                                ForEach(0..<images.count) { imageIndex in
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(height: 4)
                                        .foregroundColor(self.imageIndex == imageIndex ? Color.white : Color.gray.opacity(0.5))
                                }
                            }
                            .padding(.top, 6)
                            .padding(.horizontal, 12)
                            
                            Spacer()

                        }
                        
                    }
                        
                    UserFirstCardInfo(name: name, age: age)
                        .padding(.horizontal, 8)
                    
                    AboutCardView()
                    
                }
                
                
                VStack {
                    Spacer()
                    
                    UserButtonsView(user: user)
                }

            }
        }
        .navigationBarHidden(true)
    }
}
/*
struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}*/

