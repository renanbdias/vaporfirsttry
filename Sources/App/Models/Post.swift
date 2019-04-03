//
//  Post.swift
//  App
//
//  Created by Renan Benatti Dias on 25/10/18.
//

import FluentMySQL
import Vapor

final class Post: MySQLModel {
    
    var id: Int?
    let title: String
    let text: String
    
    let userId: Int
}

extension Post {
    
    var user: Parent<Post, User> {
        return parent(\.userId)
    }
}
