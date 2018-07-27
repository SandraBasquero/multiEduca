//
//  Provider.swift
//  MultiEduca
//
//  Created by Sandra on 31/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation


class HomeDataProvider {
    
    let fileManager:FilesManagerContract = FilesManager()
    let cache:HomeDataCacheContract = HomeDataCache()
}


extension HomeDataProvider: HomeDataProviderContract {
    
    // TODO: Async
    func getHomeData() -> [HomeDataModel]
    {
        return fileManager.readHomeDataFile()
    }
    
}
