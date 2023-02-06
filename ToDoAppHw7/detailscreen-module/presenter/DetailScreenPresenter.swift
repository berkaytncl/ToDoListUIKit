//
//  DetailScreenPresenter.swift
//  ToDoAppHw7
//
//  Created by Berkay Tuncel on 2.02.2023.
//

import Foundation

class DetailScreenPresenter: ViewToPresenterDetailScreenProtocol {
    var detailScreenInteractor: PresenterToInteractorDetailScreenProtocol?
    
    func update(todoId: Int, title: String, description: String, lastChangedTime: Int) {
        detailScreenInteractor?.update(todoId: todoId, title: title, description: description, lastChangedTime: lastChangedTime)
    }
}
