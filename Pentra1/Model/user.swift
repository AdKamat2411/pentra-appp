//
//  user.swift
//  TinderClone
//
//  Created by Aditya Kamat on 08/10/2023.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let email: String
    let name: String
    var age: Int?
    var bio: String?
    var ig: String?
    var tiktok: String?
    var yt: String?
    var best_email: String?
    var rates: String?
    var house: String?
    var ref: String?
    var country: String?
    var profileImageUrl: String? = ""
    var gender: String = "influencer"
    var preference: String = "brand"
    var PostMedium: Array<String> = []
    var PersonalBrand: Array<String> = []
    var brand: Array<String> = []
    var swipesLeft: Array<String> = []
    var swipesRight: Array<String> = []
    var matches: Array<String> = []
    
    static let mockUsers: [User] = [
        .init(id: NSUUID().uuidString, email: "alice@gmail.com", name: "Alice", age: 29, bio: "At FENTY, we’re trying to lorem ipsum lorem ipsum ipsum lorem and all that to be honest.\n\nWe’re looking for creators that have 10k or more followers with an engaged skincare audience.  If that sounds like you, feel free to apply!", ig: "@kimK", tiktok: "@kimK", yt: "@kimK", best_email: "alice@gmail.com", rates: "", house: "Waterloo", ref: "", country: "United States",profileImageUrl: "https://scontent.cdninstagram.com/v/t51.2885-19/106271953_277293516919653_6464238007388654176_n.jpg?stp=dst-jpg_s160x160&_nc_cat=1&ccb=1-7&_nc_sid=c4dd86&_nc_ohc=3oCqvPsPTz4AX8U9-zC&_nc_ht=scontent.cdninstagram.com&oh=00_AfDeVXSxCP5JvEOw9--lWj_QpoS3umRabVzsVKh2GZyxGw&oe=653EA2AE", gender: "influencer", preference: "brand", PostMedium: [ "igStory", "tiktok"], PersonalBrand: ["Makeup", "Skincare"]),
        .init(id: NSUUID().uuidString, email: "u2@gmail.com", name: "u2", age: 29, bio: "u2bio", profileImageUrl: "ai_man2"),
        .init(id: NSUUID().uuidString, email: "u3@gmail.com", name: "u3", age: 29, bio: "u3bio", profileImageUrl: "ai_man3"),
        .init(id: NSUUID().uuidString, email: "u4@gmail.com", name: "u4", age: 29, bio: "u4bio", profileImageUrl: "ai_man4"),
        .init(id: NSUUID().uuidString, email: "u5@gmail.com", name: "u5", age: 29, bio: "u5bio", profileImageUrl: "ai_man5"),
        .init(id: NSUUID().uuidString, email: "u6@gmail.com", name: "u6", age: 29, bio: "u6bio", profileImageUrl: "ai_woman1"),
        .init(id: NSUUID().uuidString, email: "u7@gmail.com", name: "u7", age: 29, bio: "u7bio", profileImageUrl: "ai_woman2"),
        .init(id: NSUUID().uuidString, email: "u8@gmail.com", name: "u8", age: 29, bio: "u8bio", profileImageUrl: "ai_woman3"),
        .init(id: NSUUID().uuidString, email: "u9@gmail.com", name: "u9", age: 29, bio: "u9bio", profileImageUrl: "ai_woman4"),
        .init(id: NSUUID().uuidString, email: "u10@gmail.com", name: "Carol", age: 29, bio: "u10bio", profileImageUrl: "ai_woman5"),
    ]
}
