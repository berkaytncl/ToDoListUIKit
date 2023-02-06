//
//  TodoAddScreenPresenter.swift
//  ToDoAppHw7
//
//  Created by Berkay Tuncel on 2.02.2023.
//

import Foundation

class TodoAddScreenPresenter: ViewToPresenterTodoAddScreenProtocol {
    var todoAddScreenInteractor: PresenterToInteractorTodoAddScreenProtocol?
    
    func save(title: String, description: String, lastChangedTime: Int) {
        todoAddScreenInteractor?.save(title: title, description: description, lastChangedTime: lastChangedTime)
    }
}
