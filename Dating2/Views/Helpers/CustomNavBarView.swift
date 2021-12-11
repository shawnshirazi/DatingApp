//
//  CustomNavBarView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/27/21.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.presentationMode) var presentation
    @Binding var selected: Int
    @State private var showingDetail = false
    //@State var viewModel = UserViewModel()

    
    var body: some View {
        VStack {
            HStack {
                
                Button("Done") {
                    
                }.opacity(0)
                
                Spacer()
                
                Text("Edit Info")
                    .font(.title3)
                    .fontWeight(.semibold)
                    
                
                Spacer()
                
                Button(action: {
                    presentation.wrappedValue.dismiss()
                    //viewModel.fetchUsers()

                }, label: {
                    Text("Done")
                })
            }
            .padding()
            
            
            HStack(alignment: .center) {                
                
                Button(action: {
                    self.selected = 0
                }, label: {
                    Text("Edit")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(self.selected == 0 ? .purple : .gray)
                })
                .padding(.horizontal, 50)
                
                
                Text("/")
                
                Button(action: {
                    self.selected = 1
                }, label: {
                    Text("View")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(self.selected == 1 ? .purple : .gray)
                })
                .padding(.horizontal, 50)
                
            }
            
        }
        .background(Color.white.ignoresSafeArea(edges: .top))
        .padding(.vertical, -5)
        
    }
}

/*
struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarView(selected: Binding<Int>)
    }
}*/
