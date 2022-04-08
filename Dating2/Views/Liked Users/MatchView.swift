//
//  MatchView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/16/21.
//

import SwiftUI

struct MatchView: View {
    
    @EnvironmentObject var viewModelMatch: MatchViewModel
    @State var didAppear = false
    @State var appearCount = 0
    
    var body: some View {
        NavigationView {
            VStack {
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(self.viewModelMatch.users) {i in
                            
                            //NavigationLink(destination: MessageView()) {
                                LikedMeDetailView(name: i.name, age: i.age, image: i.ImageUrl)
                            //}
                        }
                    }
                }
                //.onAppear(perform: onLoad)
            }
            .navigationBarTitle("Matches")

        }
    }
    
    func onLoad() {
        if !didAppear {
            appearCount += 1
            viewModelMatch.fetchMatch()
        }
        didAppear = true
    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView()
    }
}
