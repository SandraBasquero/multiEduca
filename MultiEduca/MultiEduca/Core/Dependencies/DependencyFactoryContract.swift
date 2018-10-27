//
//  DependencyFactoryContract.swift
//  MultiEduca
//
//  Created by Sandra on 30/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation


protocol DependencyFactoryContract {
    
    static func createHomeModule() -> HomeViewContract
    static func createLevelsModule(withData:SectionCellViewModel) -> LevelsViewContract
    static func createGameAreaModule(gameId:String, levelId:String, title:String) -> GameAreaViewContract
}
