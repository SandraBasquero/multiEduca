//
//  LevelsRouter.swift
//  MultiEduca
//
//  Created by Sandra on 25/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation
import UIKit


class LevelsRouter {
    
    var view:UIViewController
    
    init(view:LevelsViewContract) {
        self.view = view as! UIViewController
    }
}


extension LevelsRouter: LevelsRouterContract {

    func navigateToGame(gameId: String, levelId: String, title:String)
    {
        let gameView = DependencyFactory.createModuleWithData(type: .GAME_TYPE, data: (gameId, levelId, title))
        view.navigationController?.pushViewController(gameView, animated: true)
    }
    
    
    func navigateBackHomeMenu()
    {
        view.navigationController?.popToRootViewController(animated: true)
    }
}
