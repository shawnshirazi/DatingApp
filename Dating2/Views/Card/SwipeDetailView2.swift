//
//  SwipeDetailView2.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/28/21.
//

import SwiftUI
import Kingfisher

struct SwipeDetailView2: View {
    
    @EnvironmentObject var viewModel: UserViewModel
    var name = "Shawn"
    var age = "22"
    var image = "https://picsum.photos/400"
    @State var offset: CGFloat = 0
    @GestureState var isDragging: Bool = false
    
    @State var endSwipe: Bool = false
    
    var body: some View {
        GeometryReader{proxy in
            let size = proxy.size
            
            //let index = CGFloat(homeData.getIndex(user: user))
            // Showing Next two cards at top like a Stack...
            ///let topOffset = (index <= 2 ? index : 2) * 15
            
            ZStack{
                
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                // Reducing width too...
                    //.frame(width: size.width - CGFloat(topOffset), height: size.height)
                    .cornerRadius(15)
                    //.offset(y: -CGFloat(topOffset))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .offset(x: offset)
        //.rotationEffect(.init(degrees: getRotation(angle: 8)))
        .contentShape(Rectangle().trim(from: 0, to: endSwipe ? 0 : 1))
    }
}

struct SwipeDetailView2_Previews: PreviewProvider {
    static var previews: some View {
        SwipeDetailView2()
    }
}
