//
//  LevelsContract.swift
//  MultiEduca
//
//  Created by Sandra on 25/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation

protocol LevelsViewContract:ViewContractBase {
    func prepareViews()
    func setLevelsGame(levels:[Int])
}

protocol LevelsPresenterContract:PresenterContractBase {
    func getLevelsForGameId(_ id:String)
    func getIdLevelOfIndex(_ index:Int, inGame:String) -> String
    func goToGame(gameId:String, levelId:String, title:String)
    func goToHomeMenu()
}

protocol LevelsInteractorContract {
    func getLevelsOfGame(gameId:String) -> [Int]?
    func getIdLevelOfIndex(_ index:Int, inGame:String) -> String
}

protocol LevelsRouterContract {
    func navigateToGame(gameId:String, levelId:String, title:String)
    func navigateBackHomeMenu()
}
