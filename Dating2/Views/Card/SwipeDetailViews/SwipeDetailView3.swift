//
//  SwipeDetailView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/28/21.
//

import SwiftUI
import Kingfisher

struct SwipeDetailView3: View {
        
    var name = "Shawn"
    var age = "22"
    var image = "https://picsum.photos/400"
    var image2 = "https://picsum.photos/401"
    var image3 = "https://picsum.photos/402"
    //var image: String
    //var image2: String
    //var image3: String
    //var height: CGFloat = 0
    
    
    var body: some View {
        /*
        ZStack {

            KFImage(URL(string: image))
                .resizable()
                .cornerRadius(20)
                .padding()
            
            VStack(alignment: .leading) {
                
                Spacer()
                
                VStack {
                    
                    Spacer()
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(name)
                                .fontWeight(.heavy)
                                .font(.system(size: 20))
                            
                            Text(age)
                        }
                        .foregroundColor(.white)
                        
                        Spacer()


                    }.padding([.bottom, .leading], 35)
                    
                }
                
            }
        }*/
        
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
                                //.background(Color(.systemGray6).opacity(0.85))
                                .foregroundColor(.black)
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
                    
                    
                    KFImage(URL(string: image3))
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: geo.size.width, height: geo.size.height)
                        
                    
                }

                
            }


        }
        .padding(.horizontal,5)
        //.padding(.bottom)
        .background(Color(.systemGray6))

        
    }
}

struct SwipeDetailView3_Previews: PreviewProvider {
    static var previews: some View {
        SwipeDetailView3()
    }
}


