//
//  LazyView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/19/21.
//

import SwiftUI

struct LazyView<Content: View>: View {
    
    @EnvironmentObject var viewModelChat: ChatViewModel
    @EnvironmentObject var viewModelMatch: MatchViewModel

    
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}


