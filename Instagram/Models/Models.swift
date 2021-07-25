//
//  Models.swift
//  Instagram
//
//  Created by Abdelrahman Moustafa on 2/6/21.
//

import Foundation

enum Gender {
    case male, female, other
}
struct User {
    let username: String
    let name: (first: String, last: String)
    let birthDate: Date
    let gender: Gender
    let bio: String
    let counts: UserCount
}
struct UserCount{
    let follower: Int
    let following: Int
    let post: Int
    let joinDate: Date
}
public enum UserPostType {
    case photo, video
}

public struct UserPost{
    let postType: UserPostType
    let identifier: String
    let thumbnailImage: URL
    let postUrl: URL // Video uRL/ Photo
    let caption: String?
    let likeCount: [postLikes]
    let comments: [postComment]
    let createdDate: Date
    let taggedUsere: [String]
    
}

struct postComment {
    let identifier: String
    let username: String
    let text: String
    let createdDate: Date
    let likes: [commentLikes]



}

struct postLikes {
    let username: String
    let postIdentifier: String
}
struct commentLikes {
    let username: String
    let commentIdentifier: String
}
