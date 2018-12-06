//
//  LevelsDataProvider.swift
//  MultiEduca
//
//  Created by Sandra on 19/8/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation


class LevelsDataProvider {
    var fileManager:FilesManagerContract
    var cache:GameContentCacheContract
    
    init(fileManager:FilesManagerContract, cache:GameContentCacheContract)
    {
        self.fileManager = fileManager
        self.cache = cache
    }
    
    fileprivate func getGameLevelsFromAllData(_ data:GameContentModel, gameId:String) -> [Int]?
    {
        var levels:[String]?
        data.forEach {
            if $0.id == gameId {
                levels = $0.levels?.map{$0.id ?? ""} ?? nil
            }
        }
        return levels?.map{Int($0.dropFirst()) ?? 0} ?? nil
    }
}


extension LevelsDataProvider: LevelsDataProviderContract {
    
    func getLevelsOfGame(id: String, completion: @escaping ([Int]?, NSError?) -> Void)
    {
        var levels:[Int]? = nil
        var error:NSError? = nil
        if let gameData = cache.getAllData() {
            levels = getGameLevelsFromAllData(gameData, gameId: id)
        } else {
            if let gameData = fileManager.readGameContentDataFile() {
                cache.saveData(gameData)
                levels = getGameLevelsFromAllData(gameData, gameId: id)
            } else {
                error = NSError()
            }
        }
        error = levels == nil ? NSError() : error
        completion(levels, error)
    }
    
    
    func getLevelIdOfIndex(_ index: Int, ofGame: String) -> String
    {
        var leveId = ""
        if let gameData = cache.getAllData() {
            gameData.forEach {
                if $0.id == ofGame {
                    if let id = $0.levels?[index].id {
                        leveId = id
                    }
                }
            }
        }
        return leveId
    }
}
