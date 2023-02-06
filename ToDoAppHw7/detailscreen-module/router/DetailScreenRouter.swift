//
//  DetailScreenRouter.swift
//  ToDoAppHw7
//
//  Created by Berkay Tuncel on 2.02.2023.
//

import Foundation

class DetailScreenRouter: PresenterToRouterDetailScreenProtocol {
    static func createModule(ref: DetailScreen) {
        ref.detailScreenPresenterObject = DetailScreenPresenter()
        ref.detailScreenPresenterObject?.detailScreenInteractor = DetailScreenInteractor()
    }
}
