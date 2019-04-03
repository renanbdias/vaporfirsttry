//
//  NewTodoController.swift
//  App
//
//  Created by Renan Benatti Dias on 23/10/18.
//

import Vapor

final class NewTodoController {
    
    func index(_ request: Request) throws -> Future<[NewTodo]> {
        return NewTodo.query(on: request).all()
    }
    
    func create(_ request: Request) throws -> Future<NewTodo> {
        return try request.content.decode(NewTodo.self).flatMap { todo in
            return todo.save(on: request)
        }
    }
    
    func delete(_ request: Request) throws -> Future<HTTPStatus> {
        return try request.parameters.next(NewTodo.self).flatMap { todo in
            return todo.delete(on: request)
        }
        .transform(to: .ok)
    }
}
