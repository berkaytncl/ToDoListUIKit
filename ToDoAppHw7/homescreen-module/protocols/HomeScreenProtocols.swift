//
//  HomeScreenProtocols.swift
//  ToDoAppHw7
//
//  Created by Berkay Tuncel on 2.02.2023.
//

import Foundation

//Main Protocols
protocol ViewToPresenterHomeScreenProtocol {
    var homeScreenInteractor: PresenterToInteractorHomeScreenProtocol? { get set }
    var homeScreenView: PresenterToViewHomeScreenProtocol? { get set }
    
    func uploadTodos()
    func search(searchWord: String)
    func delete(todoId: Int)
}

protocol PresenterToInteractorHomeScreenProtocol {
    var homeScreenPresenter: InteractorToPresenterHomeScreenProtocol? { get set }
    
    func uploadTodos()
    func search(searchWord: String)
    func delete(todoId: Int)
}

//Carrer Protocoller
protocol InteractorToPresenterHomeScreenProtocol {
    func dataSendToPresenter(todoList: [ToDos])
}

protocol PresenterToViewHomeScreenProtocol {
    func dataSendToView(todoList: [ToDos])
}

//Router Protocol
protocol PresenterToRouterHomeScreenProtocol {
    static func createModule(ref: HomeScreen)
}
