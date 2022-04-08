//
//  Message.swift
//  Dating2
//
//  Created by Shawn Shirazi on 12/19/21.
//

import Foundation

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool

}

let MOCK_MESSAGES: [MockMessage] = [
    .init(id: 0, imageName: "bird", messageText: "Whats good", isCurrentUser: false),
    .init(id: 1, imageName: "", messageText: "Nothing much", isCurrentUser: true),
    .init(id: 2, imageName: "bird", messageText: "sick", isCurrentUser: false),
    .init(id: 3, imageName: "", messageText: "yea", isCurrentUser: true),
    .init(id: 4, imageName: "bird", messageText: "niceidcsidhaihdiuashdusahdsad", isCurrentUser: false),
    .init(id: 5, imageName: "", messageText: "hell yea", isCurrentUser: true)

]
