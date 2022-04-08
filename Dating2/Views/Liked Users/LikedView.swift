//
//  LikedView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/11/21.
//

import SwiftUI

struct LikedView: View {
    
    @EnvironmentObject var viewModelLiked: likedUserViewModel
    @State var didAppear = false
    @State var appearCount = 0
    
    var body: some View {
        VStack {
            Text("Liked Users")
            
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(self.viewModelLiked.users) {i in
                        
                        likedDetailview(name: i.name, age: i.age, image: i.ImageUrl)

                    }
                }
            }
            //.onAppear(perform: onLoad)
     
        }
        .navigationBarHidden(true)
    }
    
    func onLoad() {
        if !didAppear {
            appearCount += 1
            viewModelLiked.fetchLikedUsers()
        }
        didAppear = true
    }
    
}

struct LikedView_Previews: PreviewProvider {
    static var previews: some View {
        LikedView()
    }
}
