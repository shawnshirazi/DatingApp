//
//  BottomView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/7/21.
//

import SwiftUI

struct BottomView: View {
    
    @EnvironmentObject var viewModel: UserViewModel

    
    var body: some View {
        HStack {
            
            Button(action: {
                if self.viewModel.last != -1 {
                    self.viewModel.goBack(index: self.viewModel.last)
                }
                
            }, label: {
                Image(systemName: "text.justify")
                    .resizable()
                    .frame(width: 35, height: 35)
            })
            .foregroundColor(.gray)
            .padding()

            
        }
    }
}

struct BottomView_Previews: PreviewProvider {
    static var previews: some View {
        BottomView()
    }
}
