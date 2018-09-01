//
//  LevelsPresenter.swift
//  MultiEduca
//
//  Created by Sandra on 25/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation


class LevelsPresenter {

    var router:LevelsRouterContract
    var view:LevelsViewContract
    var interactor:LevelsInteractorContract
    
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
    
    
    func goToGame(gameId: String, levelId: String)
    {
        router.navigateToGame(gameId: gameId, levelId: levelId)
    }
    
    
    func goToHomeMenu()
    {
        router.navigateBackHomeMenu()
    }
}
