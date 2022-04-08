//
//  FullCardView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/27/21.
//

import SwiftUI

struct FullCardView: View {
    
    @EnvironmentObject var viewModel: UserViewModel

    var body: some View {
                                
            ZStack {
                
                if viewModel.users.isEmpty {
                    Loader()
                }
                
                VStack {
                    TopView()
                    
                    //SwipeView()
                    //DiscoverView()
                    DiscoView2()
                    
                }
                
                /*
                VStack {
                    //TopView()
                    
                    SwipeView()
                        .environmentObject(viewModel)
                    
                    //CardView()
                    
                    //Spacer()
                    
                    //BottomView()
                }
                .navigationBarHidden(true)
                */
            }
            .navigationBarHidden(true)


        
    }
}

struct FullCardView_Previews: PreviewProvider {
    static var previews: some View {
        FullCardView()
    }
}

struct Loader: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<Loader>) -> UIActivityIndicatorView {
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Loader>) {
        
    }
}
