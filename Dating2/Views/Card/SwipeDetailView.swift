//
//  SwipeDetailView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/28/21.
//

import SwiftUI
import Kingfisher

struct SwipeDetailView: View {
    
    var name = "Shawn"
    var age = "22"
    var image = "https://picsum.photos/400"
    
    var body: some View {
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
        }
    }
}

struct SwipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeDetailView()
    }
}
