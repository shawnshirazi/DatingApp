//
//  UserButtonsView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 1/11/22.
//

import SwiftUI

struct UserButtonsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: UserViewModel
    let user: User

    
    var body: some View {
        HStack {

            Button(action: {
                viewModel.update(id: user, value: -500, degree: 0)
                viewModel.updateDB(id: user, user: user.id, status: 0)
                viewModel.frameMaxHeight(id: user, value: 0)
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
            })
            .padding(18)
            .background(Color.yellow)
            .clipShape(Circle())
            .shadow(color: .gray, radius: 5, x: 0, y: 4)
            .padding(.horizontal)

            
            
            Button(action: {}, label: {
                Image(systemName: "star.fill")
            })
            .padding()
            .background(Color.yellow)
            .clipShape(Circle())
            .shadow(color: .gray, radius: 5, x: 0, y: 4)


            
            
                
            Button(action: {
                viewModel.update(id: user, value: 500, degree: 0)
                viewModel.updateDB(id: user, user: user.id, status: 1)
                viewModel.frameMaxHeight(id: user, value: 0)
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "heart.fill")
            })
            .padding(18)
            .background(Color.yellow)
            .clipShape(Circle())
            .shadow(color: .gray, radius: 5, x: 0, y: 4)
            .padding(.horizontal)


            
        }
    }
}

/*
struct UserButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        UserButtonsView()
    }
}*/
