//
//  GameContentCache.swift
//  MultiEduca
//
//  Created by Sandra on 19/8/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation

class GameContentCache {
    
    static let shared = GameContentCache()
    private var dataContent:GameContentModel?
    
    private init(){}
}


extension GameContentCache: GameContentCacheContract {
    
    func saveData(_ data: GameContentModel)
    {
        dataContent = data
    }
    
    func getAllData() -> GameContentModel?
    {
        return dataContent
    }
}
