//
//  UserFirstCardInfo.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/28/21.
//

import SwiftUI

struct UserFirstCardInfo: View {
    
    var name = "Shawn"
    var age = "22"
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(name +  ",")
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                            
                Text(age)
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                
                Spacer()

            }
            .padding(.bottom, 1)
            
            
            HStack {
                Image(systemName: "briefcase")
                    //.imageScale(.small)
                    //.font(Font.title.weight(.medium))
                    .padding(.leading, -2)
                
                Text("Baller")
                    .font(.system(size: 20))
                   // .fontWeight(.medium)
            }
            .padding(.bottom, 1)
            
            /*
            HStack {
                Image(systemName: "graduationcap")
                    .imageScale(.small)
                    .font(Font.title.weight(.semibold))
                    .padding(.horizontal, -2)

                Text("Baller University")
                    .fontWeight(.semibold)
            }
            .padding(.bottom, 3)
            */
            
            Text("5 miles away")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .padding(.leading, 2)
                .padding(.bottom, 15)
            

            /*
            HStack {
                Image(systemName: "person.fill")
                    .foregroundColor(.white)
                    .padding(.horizontal, 2)
                    .padding(2)
                    //.background(Color(.systemGreen))
                    .background(Color("themeColor"))
                    .cornerRadius(5)

                Text("About me")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    //.padding(.bottom, 5)
            }
            .padding(.bottom, 2)
            */
            
            //Text("I went to Baller University and now I ball for a living. Looking to ball. ")
                //.fontWeight(.medium)
                //.padding(.bottom, 30)
        }
    }
}

struct UserFirstCardInfo_Previews: PreviewProvider {
    static var previews: some View {
        UserFirstCardInfo()
    }
}
