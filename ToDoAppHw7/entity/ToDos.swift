//
//  ToDos.swift
//  ToDoAppHw7
//
//  Created by Berkay Tuncel on 3.02.2023.
//

import Foundation

struct ToDos {
    let todoId: Int?
    let title: String?
    let description: String?
    let lastChangedTime: Int?
    
    var _todoId: Int {
        todoId ?? -1
    }
    var _title: String {
        title ?? "N/A"
    }
    var _description: String {
        description ?? "N/A"
    }
    var _lastChangedTime: Int {
        lastChangedTime ?? -1
    }
}
