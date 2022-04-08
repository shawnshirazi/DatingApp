//
//  AboutCardView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/29/21.
//

import SwiftUI

struct AboutCardView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("About me")
                .fontWeight(.bold)
                .font(.system(size: 20))
                .padding(.bottom, 5)
                        
            Text("I went to Baller University and now I ball for a living. Looking to ball")
                .fontWeight(.semibold)
                .font(.system(size: 18))
                //.padding(.bottom, 30)
                .padding(.bottom, 20)

            Divider()
            
            HStack {
                Image(systemName: "ruler")
                
                Text("7'5")
                    .fontWeight(.semibold)
                
                
                Image(systemName: "mappin")

                Text("Corona")
                    .fontWeight(.semibold)

            }
            .font(.system(size: 18))
            .padding(.bottom, 30)
                
                //UserInfoView()

            }
    }
}

struct AboutCardView_Previews: PreviewProvider {
    static var previews: some View {
        AboutCardView()
    }
}
