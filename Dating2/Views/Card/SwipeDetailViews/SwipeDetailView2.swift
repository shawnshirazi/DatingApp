//
//  SwipeDetailView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/29/21.
//

import SwiftUI
import Kingfisher

struct SwipeDetailView2: View {
    var name = "Shawn"
    var age = "22"
    var image = "https://picsum.photos/400"
    var image2 = "https://picsum.photos/401"

    var images: [KFImage] = []

    
    mutating func arrayImage() {
        let KF1 = KFImage(URL(string: image))
        images.append(KF1)
        
        let KF2 = KFImage(URL(string: image2))
        images.append(KF2)

    }
    
    var body: some View {
        /*
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ZStack {
                        KFImage(URL(string: image))
                            .resizable()
                            .cornerRadius(20)
                            .frame(width: geo.size.width, height: geo.size.height)
                    
        
                        VStack {
                            Spacer()
                            
                            UserFirstCardInfo(name: name, age: age)
                                .padding(15)
                                .background(Color("cardColor").opacity(0.75))
                                //.background(Color.black)
                                .foregroundColor(.white)
                                .frame(width: geo.size.width / 1.05, height: geo.size.height / 6)
                                .cornerRadius(15)

                        }
                        .padding()

                    }
                    
                    AboutCardView()
                        .background(Color.white)
                        .cornerRadius(20)
                        .frame(width: geo.size.width, height: geo.size.height / 2)
                    
                    KFImage(URL(string: image2))
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: geo.size.width, height: geo.size.height)

                }

                
            }


        }
        .padding(.horizontal,5)
        //.padding(.bottom)
        //.background(Color.white)
        .background(Color(.systemGray6))
*/
        
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    //ZStack {
                    
                    
                    
                    TabView {
                        KFImage(URL(string: image))
                            .resizable()
                        
                        KFImage(URL(string: image2))
                            .resizable()
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    .cornerRadius(20)
                    .frame(width: geo.size.width, height: geo.size.height / 1.8)

                    

                    /*
                        KFImage(URL(string: image))
                            .resizable()
                            .cornerRadius(20)
                            .frame(width: geo.size.width, height: geo.size.height / 1.8)
                    */
        
                        UserFirstCardInfo()
                            .padding(.horizontal, 8)
                    


                    //}
                    

                }
            }
        }
        .padding(.horizontal,5)
        //.padding(.bottom)
        .background(Color.white)
        //.background(Color(.systemGray6))
    }
}

struct SwipeDetailView2_Previews: PreviewProvider {
    static var previews: some View {
        SwipeDetailView2()
    }
}

