//
//  LevelsPresenter.swift
//  MultiEduca
//
//  Created by Sandra on 25/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation


class LevelsPresenter: LevelsPresenterContract {

    var router:LevelsRouterContract
    var view:LevelsViewContract
    
    init(view:LevelsViewContract, router:LevelsRouterContract) {
        self.view = view
        self.router = router
    }

    func start()
    {
        view.prepareViews()
    }
}
