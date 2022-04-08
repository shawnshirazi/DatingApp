//
//  LikedMeDetailView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/14/21.
//

import SwiftUI
import Kingfisher

struct LikedMeDetailView: View {
    
    var name = "Shawn"
    var age = "22"
    var image = "https://picsum.photos/400"
    
    var body: some View {
        
        //GeometryReader { geo in
            ZStack(alignment: .bottomLeading) {
                KFImage(URL(string: image))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 350 / 2, height: 240)
                
                Text("\(name), \(age)")
                    .padding()
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
            }
            .cornerRadius(16)
            .navigationBarHidden(true)
        //}
    }
}

struct LikedMeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LikedMeDetailView()
    }
}
