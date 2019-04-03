//
//  User.swift
//  App
//
//  Created by Renan Benatti Dias on 24/10/18.
//

import FluentMySQL
import Vapor

final class User: MySQLModel {
    var id: Int?
    let name: String
    let lastName: String
    let age: Int
    
}

extension User {
    
    var posts: Children<User, Post> {
        return children(\.userId)
    }
}

extension User: Content {  }

extension User: Parameter {  }

