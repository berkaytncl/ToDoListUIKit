//
//  TodoAddScreenRouter.swift
//  ToDoAppHw7
//
//  Created by Berkay Tuncel on 2.02.2023.
//

import Foundation

class TodoAddScreenRouter: PresenterToRouterTodoAddScreenProtocol {
    static func createModule(ref: TodoAddScreen) {
        ref.todoAddScreenPresenterObject = TodoAddScreenPresenter()
        ref.todoAddScreenPresenterObject?.todoAddScreenInteractor = TodoAddScreenInteractor()
    }
}
