//
//  TodoAddScreenProtocols.swift
//  ToDoAppHw7
//
//  Created by Berkay Tuncel on 2.02.2023.
//

import Foundation

protocol ViewToPresenterTodoAddScreenProtocol {
    var todoAddScreenInteractor: PresenterToInteractorTodoAddScreenProtocol? { get set }
    
    func save(title: String, description: String, lastChangedTime: Int)
}

protocol PresenterToInteractorTodoAddScreenProtocol {
    func save(title: String, description: String, lastChangedTime: Int)
}

protocol PresenterToRouterTodoAddScreenProtocol {
    static func createModule(ref: TodoAddScreen)
}
