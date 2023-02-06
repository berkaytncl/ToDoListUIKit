//
//  TodoAddScreenInteractor.swift
//  ToDoAppHw7
//
//  Created by Berkay Tuncel on 2.02.2023.
//

import Foundation

class TodoAddScreenInteractor: PresenterToInteractorTodoAddScreenProtocol {
    
    func save(title: String, description: String, lastChangedTime: Int) {
        DatabaseManager.shared.save(title: title, description: description, lastChangedTime: lastChangedTime)
    }
}
