//
//  DetailScreenInteractor.swift
//  ToDoAppHw7
//
//  Created by Berkay Tuncel on 2.02.2023.
//

import Foundation

class DetailScreenInteractor: PresenterToInteractorDetailScreenProtocol {
    
    func update(todoId: Int, title: String, description: String, lastChangedTime: Int) {
        DatabaseManager.shared.update(todoId: todoId, title: title, description: description, lastChangedTime: lastChangedTime)
    }
}
