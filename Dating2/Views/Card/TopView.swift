//
//  TopView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/27/21.
//

import SwiftUI
import Firebase

struct TopView: View {
        
    @EnvironmentObject var viewModel: AuthViewModel
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false

    
    var body: some View {
        
            HStack {
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "text.justify")
                        .resizable()
                        .frame(width: 35, height: 35)
                })
                .foregroundColor(.gray)
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("LOGO")
                        .font(.title)
                })
                .foregroundColor(.red)
                
                Spacer()
                
                NavigationLink(destination: Preferences(), label: {
                    Image(systemName: "slider.horizontal.3")
                        .resizable()
                        .frame(width: 35, height: 35)
                })
                .foregroundColor(.gray)

                
            }
            .padding()
    }
    
}


struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
