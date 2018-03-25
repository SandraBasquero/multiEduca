//
//  DependencyFactory.swift
//  MultiEduca
//
//  Created by Sandra on 17/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation


enum ModuleType {
    case HOME_TYPE
    case LEVELS_TYPE
}


class DependencyFactory {
    
    static func moduleDependencies(moduleType:ModuleType, view:ViewContractBase) -> PresenterContractBase?{
        switch moduleType {
        case .HOME_TYPE:
            var presenter:HomePresenterContract {
                let router:HomeRouterContract = HomeRouter(view: view as! HomeViewContract)
                return HomePresenter(view: view as! HomeViewContract, router: router)
            }
            return presenter
        case .LEVELS_TYPE:
            var presenter:LevelsPresenterContract {
                let router:LevelsRouterContract = LevelsRouter(view: self as! LevelsViewContract)
                return LevelsPresenter(view: self as! LevelsViewContract, router: router)
            }
            return presenter
        }
    }
    
}






