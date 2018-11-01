//
//  LevelsPresenter.swift
//  MultiEduca
//
//  Created by Sandra on 25/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation


class LevelsPresenter {

    let router:LevelsRouterContract
    let view:LevelsViewContract
    let interactor:LevelsInteractorContract
    
    init(view:LevelsViewContract, router:LevelsRouterContract, interactor:LevelsInteractorContract) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}


extension LevelsPresenter: LevelsPresenterContract {
    
    func start()
    {
        view.prepareViews()
    }
    
    
    func getLevelsForGameId(_ id: String)
    {
        if let levelsGame = interactor.getLevelsOfGame(gameId: id) {
            view.setLevelsGame(levels: levelsGame)
        } else {
            view.showAlert(title: "", message: "level_no_level_error_message".localized)
        }
    }
    
    
    func getIdLevelOfIndex(_ index: Int, inGame: String) -> String
    {
        return interactor.getIdLevelOfIndex(index, inGame: inGame)
    }
    
    
    func goToGame(gameId: String, levelId: String, title:String)
    {
        router.navigateToGame(gameId: gameId, levelId: levelId, title: title)
    }
    
    
    func goToHomeMenu()
    {
        router.navigateBackHomeMenu()
    }
}
