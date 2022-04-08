//
//  UserInfoView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/29/21.
//

import SwiftUI

struct UserInfoView: View {
    var body: some View {
        /*VStack(alignment: .leading) {
            HStack {
                HStack {
                    Image(systemName: "person")
                    Text("Man")
                    
                }
                .padding(8)
                .background(Color(.systemGray5))
                .cornerRadius(15)
                
                
                HStack {
                    Image(systemName: "ruler")
                    Text("7'5")
                }
                .padding(8)
                .background(Color(.systemGray5))
                .cornerRadius(15)

                HStack {
                    Image(systemName: "link")
                    Text("African American")
                }
                .padding(8)
                .background(Color(.systemGray5))
                .cornerRadius(15)
                
            }
            
            HStack {
                Image(systemName: "link")
                Text("African American")
            }
            .padding(8)
            .background(Color(.systemGray5))
            .cornerRadius(15)
        }*/
        
        VStack(alignment: .leading) {
            HStack {
                HStack {
                    Image(systemName: "person")
                    Text("Man")
                    
                }
                .padding(8)
                .background(Color(.systemGray5))
                .cornerRadius(15)
                
                
                HStack {
                    Image(systemName: "ruler")
                    Text("7'5")
                }
                .padding(8)
                .background(Color(.systemGray5))
                .cornerRadius(15)

                HStack {
                    Image(systemName: "link")
                    Text("African American")
                }
                .padding(8)
                .background(Color(.systemGray5))
                .cornerRadius(15)
                
            }
            
            HStack {
                Image(systemName: "link")
                Text("African American")
            }
            .padding(8)
            .background(Color(.systemGray5))
            .cornerRadius(15)
        }
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}
