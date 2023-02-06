//
//  DetailScreenProtocols.swift
//  ToDoAppHw7
//
//  Created by Berkay Tuncel on 2.02.2023.
//

import Foundation

protocol ViewToPresenterDetailScreenProtocol {
    var detailScreenInteractor: PresenterToInteractorDetailScreenProtocol? { get set }
    
    func update(todoId: Int, title: String, description: String, lastChangedTime: Int)
}

protocol PresenterToInteractorDetailScreenProtocol {
    func update(todoId: Int, title: String, description: String, lastChangedTime: Int)
}

protocol PresenterToRouterDetailScreenProtocol {
    static func createModule(ref: DetailScreen)
}
