//
//  Message.swift
//  TinderClone
//
//  Created by Aditya Kamat on 25/10/2023.
//

import Foundation
import Firebase

struct Message: Identifiable, Codable, Hashable {
    var id: String = NSUUID().uuidString
    let sentBy: String
    let text: String
    let timestamp: Timestamp
}
