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
        if let levelsGame = interactor.getLevelsOfGame(gameId: "1") {
            print(levelsGame ?? "Nothing")
        } else {
            // TODO: render error
        }
    }
}
