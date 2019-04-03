//
//  NewTodo.swift
//  App
//
//  Created by Renan Benatti Dias on 23/10/18.
//

import FluentMySQL
import Vapor

final class NewTodo: MySQLModel {
    var id: Int?
    var title: String
    
    init(id: Int? = nil, title: String) {
        self.id = id
        self.title = title
    }
}

extension NewTodo: MySQLMigration {  }

extension NewTodo: Content {  }

extension NewTodo: Parameter {  }
