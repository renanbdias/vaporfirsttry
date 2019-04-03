//
//  UserController.swift
//  App
//
//  Created by Renan Benatti Dias on 25/10/18.
//

import Vapor

final class UserController {
    
    func index(_ request: Request) throws -> Future<[User]> {
        return User.query(on: request).all()
    }
    
    func create(_ request: Request) throws -> Future<User> {
        return try request.content.decode(User.self).flatMap { user in
            return user.save(on: request)
        }
    }
    
    func delete(_ request: Request) throws -> Future<HTTPStatus> {
        return try request.parameters.next(User.self).flatMap { user in
            return user.delete(on: request)
        }
        .transform(to: .ok)
    }
}
