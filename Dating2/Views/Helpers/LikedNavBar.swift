//
//  LikedNavBar.swift
//  Dating2
//
//  Created by Shawn Shirazi on 1/2/22.
//

import SwiftUI

struct LikedNavBar: View {
    @Environment(\.presentationMode) var presentation
    @State private var showingDetail = false
    //@State var viewModel = UserViewModel()
    @EnvironmentObject var viewModel: UserViewModel


    
    var body: some View {
        VStack {
            
            HStack(alignment: .center) {
                
                Text("Likes You")
                
            }
            
        }
        .background(Color.white.ignoresSafeArea(edges: .top))
        .padding(.vertical, -5)
        
    }
}

struct LikedNavBar_Previews: PreviewProvider {
    static var previews: some View {
        LikedNavBar()
    }
}
