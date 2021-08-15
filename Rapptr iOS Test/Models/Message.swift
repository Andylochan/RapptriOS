//
//  Message.swift
//  Rapptr iOS Test
//

import Foundation

struct Data: Decodable {
    var data: [Message]
}

struct Message: Decodable {
    var userID: String
    var username: String
    var avatarURL: URL?
    var text: String

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case username = "name"
        case avatarURL = "avatar_url"
        case text = "message"
    }

    init(testName: String, withTestMessage message: String) {
        self.userID = "0"
        self.username = testName
        self.avatarURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Smiley.svg/220px-Smiley.svg.png")
        self.text = message
    }
}
