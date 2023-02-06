//
//  HomeScreenInteractor.swift
//  ToDoAppHw7
//
//  Created by Berkay Tuncel on 2.02.2023.
//

import Foundation

class HomeScreenInteractor: PresenterToInteractorHomeScreenProtocol {
    
    var homeScreenPresenter: InteractorToPresenterHomeScreenProtocol?
    
    func uploadTodos() {
        var todoList = [ToDos]()
        todoList = DatabaseManager.shared.uploadTodos()
        
        homeScreenPresenter?.dataSendToPresenter(todoList: todoList)
    }
    
    func search(searchWord: String) {
        var todoList = [ToDos]()
        todoList = DatabaseManager.shared.search(searchWord: searchWord)
        
        homeScreenPresenter?.dataSendToPresenter(todoList: todoList)
    }
    
    func delete(todoId: Int) {
        DatabaseManager.shared.delete(todoId: todoId)
        uploadTodos()
    }
}
