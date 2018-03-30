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
}


class DependencyFactory {
    
    static let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    static func createModule(type:ModuleType) -> UIViewController
    {
        switch type {
        case .HOME_TYPE:
            return createHomeModule() as! UIViewController
        case .LEVELS_TYPE:
            return createLevelsModule() as! UIViewController
        }
    }
    
}


extension DependencyFactory: DependencyFactoryContract {
    
    internal static func createHomeModule() -> HomeViewContract
    {
        let view = storyboard.instantiateViewController(withIdentifier: "HomeView") as! HomeView
        let router:HomeRouterContract = HomeRouter(view: view as HomeViewContract )
        let presenter:HomePresenterContract = HomePresenter(view: view as HomeViewContract , router: router)
        view.presenter = presenter as! HomePresenter
        return view as HomeViewContract
    }
    
    
    internal static func createLevelsModule() -> LevelsViewContract
    {
        let view = storyboard.instantiateViewController(withIdentifier: "LevelsView") as! LevelsView
        let router:LevelsRouterContract = LevelsRouter(view: view as LevelsViewContract)
        let presenter:LevelsPresenterContract = LevelsPresenter(view: view as LevelsViewContract, router: router)
        view.presenter = presenter as! LevelsPresenter
        return view as LevelsViewContract
    }
}





