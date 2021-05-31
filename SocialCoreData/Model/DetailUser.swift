//
//  DetailUser.swift
//  Network Social App
//
//  Created by Natanael Diego on 24/05/21.
//

import Foundation

// MARK: - DetailUser
struct DetailUser: Codable, Identifiable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
