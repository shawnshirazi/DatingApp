//
//  likedDetailview.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/14/21.
//

import SwiftUI
import Kingfisher

struct likedDetailview: View {
    
    var name = "Shawn"
    var age = "22"
    var image = "https://picsum.photos/400"
    
    var body: some View {
        HStack {
            
            KFImage(URL(string: image))
                .resizable()
                .cornerRadius(20)
                .padding()
                .frame(width: 100, height: 100)
            
            
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
                        .foregroundColor(.black)
                        
                        Spacer()


                    }.padding([.bottom, .leading], 35)
                    
                }
                
            }
        }
    }
}


struct likedDetailview_Previews: PreviewProvider {
    static var previews: some View {
        likedDetailview()
    }
}
