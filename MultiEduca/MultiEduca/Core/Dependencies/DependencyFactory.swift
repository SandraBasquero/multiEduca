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
    
    static let storyboard = UIStoryboard(name: "Main", bundle: nil) // TODO: Provider ?
    
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
        }
    }
    
}


extension DependencyFactory: DependencyFactoryContract {

    internal static func createHomeModule() -> HomeViewContract
    {
        let view = storyboard.instantiateViewController(withIdentifier: "HomeView") as! HomeView
        let filesManager:FilesManagerContract = FilesManager() // TODO: Provider
        let interactor:HomeInteractorContract = HomeInteractor(filesManager: filesManager)
        let router:HomeRouterContract = HomeRouter(view: view as HomeViewContract )
        let presenter:HomePresenterContract = HomePresenter(view: view as HomeViewContract , router: router, interactor: interactor)
        view.presenter = presenter as? HomePresenter
        return view as HomeViewContract
    }
    
    
    internal static func createLevelsModule(withData:SectionCellViewModel) -> LevelsViewContract
    {
        let view = storyboard.instantiateViewController(withIdentifier: "LevelsView") as! LevelsView
        view.setData(data: withData)
        let router:LevelsRouterContract = LevelsRouter(view: view as LevelsViewContract)
        let presenter:LevelsPresenterContract = LevelsPresenter(view: view as LevelsViewContract, router: router)
        view.presenter = presenter as? LevelsPresenter
        return view as LevelsViewContract
    }
}





