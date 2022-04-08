//
//  CardView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/27/21.
//

import SwiftUI
import Kingfisher

struct CardView: View {
    
    //@EnvironmentObject var viewModel: UserViewModel
    
    @ObservedObject var viewModel = UserViewModel()



    init() {
        //viewModel.fetchUsers()
        //viewModel.fetchCurrentUser()
        viewModel.fetchCurrentUser()
    }
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                
                //KFImage(URL(string: "https://picsum.photos/400"))
                KFImage(URL(string: viewModel.user.ImageUrl))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    //.clipShape(Circle())
                
                
                Text("BIO: I LIKE TO DO STUFF")
                    .padding()
                
                //KFImage(URL(string: "https://picsum.photos/401"))
                KFImage(URL(string: viewModel.user.ImageUrl2))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    //.clipShape(Circle())
                
                Text("INTERESTS: Painting")
                    .padding()
                    
                //KFImage(URL(string: "https://picsum.photos/402"))
                KFImage(URL(string: viewModel.user.ImageUrl3))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    //.clipShape(Circle())
                
            }
        }
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}

