//
//  DependencyFactory.swift
//  MultiEduca
//
//  Created by Sandra on 17/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation
import UIKit


enum ModuleType {
    case HOME_TYPE
    case LEVELS_TYPE
    case GAME_TYPE
}


class DependencyFactory {
    
    static let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    static func createModule(type:ModuleType) -> UIViewController
    {
        return createModuleWithData(type: type, data: AnyObject.self)
    }
    
    
    static func createModuleWithData<T>(type:ModuleType, data:T?) -> UIViewController
    {
        switch type {
        case .HOME_TYPE:
            return createHomeModule() as! UIViewController
        case .LEVELS_TYPE:
            typealias T = SectionCellViewModel
            return createLevelsModule(withData: data as! T) as! UIViewController
        case .GAME_TYPE:
            typealias T = (String, String, String)
            let dataGame = data as! T
            return createGameAreaModule(gameId: dataGame.0, levelId: dataGame.1, title: dataGame.2) as! UIViewController
        }
    }
    
}


extension DependencyFactory: DependencyFactoryContract {
    

    internal static func createHomeModule() -> HomeViewContract
    {
        let view = storyboard.instantiateViewController(withIdentifier: "HomeView") as! HomeView
        let provider:HomeDataProviderContract = HomeDataProvider()
        let interactor:HomeInteractorContract = HomeInteractor(provider: provider)
        let router:HomeRouterContract = HomeRouter(view: view as HomeViewContract )
        let presenter:HomePresenterContract = HomePresenter(view: view as HomeViewContract , router: router, interactor: interactor)
        view.presenter = presenter as? HomePresenter
        return view as HomeViewContract
    }
    
    
    internal static func createLevelsModule(withData:SectionCellViewModel) -> LevelsViewContract
    {
        let view = storyboard.instantiateViewController(withIdentifier: "LevelsView") as! LevelsView
        view.setData(data: withData)
        let provider:LevelsDataProviderContract = LevelsDataProvider(fileManager: FilesManager(), cache: GameContentCache.shared)
        let interactor:LevelsInteractorContract = LevelsInteractor(provider: provider)
        let router:LevelsRouterContract = LevelsRouter(view: view as LevelsViewContract)
        let presenter:LevelsPresenterContract = LevelsPresenter(view: view as LevelsViewContract, router: router, interactor: interactor)
        view.presenter = presenter as? LevelsPresenter
        return view as LevelsViewContract
    }
    
    
    internal static func createGameAreaModule(gameId: String, levelId: String, title:String) -> GameAreaContract
    {
        let view = storyboard.instantiateViewController(withIdentifier: "GameAreaView") as! GameAreaView
        view.setGameId(gameId, andLevelId: levelId, title: title)
        return view as GameAreaContract
    }
}





