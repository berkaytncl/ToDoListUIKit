//
//  HomeScreenRouter.swift
//  ToDoAppHw7
//
//  Created by Berkay Tuncel on 2.02.2023.
//

import Foundation

class HomeScreenRouter: PresenterToRouterHomeScreenProtocol {
    static func createModule(ref: HomeScreen) {
        let presenter = HomeScreenPresenter()
        
        //View
        ref.homeScreenPresenterObject = presenter
        
        //Presenter
        ref.homeScreenPresenterObject?.homeScreenInteractor = HomeScreenInteractor()
        ref.homeScreenPresenterObject?.homeScreenView = ref
        
        //Interactor
        ref.homeScreenPresenterObject?.homeScreenInteractor?.homeScreenPresenter = presenter
    }
}
