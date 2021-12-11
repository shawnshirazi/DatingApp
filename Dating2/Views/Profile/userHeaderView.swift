//
//  userHeaderView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/27/21.
//

import SwiftUI
import Kingfisher
import Firebase

struct userHeaderView: View {
    
    @State private var isPresented = false
    @EnvironmentObject var viewModel: UserViewModel


    var body: some View {
            VStack {
                Button(action: {
                    self.isPresented.toggle()
                }, label: {
                    ZStack {
                        KFImage(URL(string: viewModel.user.ImageUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(height: 200)

                                            
                            Image(systemName: "pencil")
                                .font(.system(size: 22, weight: .heavy))
                                .foregroundColor(Color.gray.opacity(0.5))
                                .frame(width: 36, height: 36)
                                .background(Color.white)
                                .clipShape(Circle())
                                .offset(y: 100)
                    }
                }).fullScreenCover(isPresented: $isPresented, content: {
                    EditProfileView()
                })

            
            HStack {
                Text(viewModel.user.name + ",")
                //Text("Shawn,")
                    .font(.title2)
                
                
                //Text(viewModel.user.age)
                Text("22")
                    .font(.title2)
                
                
                }
                .padding()
                
                
            }
            .onAppear {
                viewModel.fetchUsers()
            }

    }
}

/*
struct userHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        userHeaderView()
    }
}*/

