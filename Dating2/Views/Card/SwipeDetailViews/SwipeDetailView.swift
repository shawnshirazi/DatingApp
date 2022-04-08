//
//  SwipeDetailView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/29/21.
//

import SwiftUI
import Kingfisher

struct SwipeDetailView: View {
    var name = "Shawn"
    var age = "22"
    var image = "https://picsum.photos/400"

    
    var body: some View {
        
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
                }

                
            }


        }
        .padding(.horizontal,5)
        //.padding(.bottom)
        //.background(Color.white)
        .background(Color(.systemGray6))

        
    }
}

struct SwipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeDetailView()
    }
}
