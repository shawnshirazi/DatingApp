//
//  ConversationCell.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/19/21.
//

import SwiftUI

struct ConversationCell: View {
    
    @EnvironmentObject var viewModelMatch: MatchViewModel

    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            LazyVStack(alignment: .leading, spacing: 20) {
                ForEach(self.viewModelMatch.users) { i in
                    
                    HStack(spacing: 15) {
                        
                        Image(i.ImageUrl)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(i.name)
                            
                            Divider()
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
