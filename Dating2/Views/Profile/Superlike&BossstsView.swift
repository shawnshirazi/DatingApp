//
//  Superlike&BossstsView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/27/21.
//

import SwiftUI

struct Superlike_BoostsView: View {
    var body: some View {
        
        
        VStack {
            
            
            HStack {
                VStack {
                    Text("Super Likes")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)

                    
                    Text("0")
                }
                .frame(width: 120, height: 50)
                .background(Color.purple)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .circular))
                
                
                
                VStack {
                    Text("Boosts")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                    
                    Text("0")
                }
                .frame(width: 120, height: 50)
                .background(Color.purple)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .circular))
            }
            
            
            
        }
        

    }
}

struct Superlike_BoostsView_Previews: PreviewProvider {
    static var previews: some View {
        Superlike_BoostsView()
    }
}
