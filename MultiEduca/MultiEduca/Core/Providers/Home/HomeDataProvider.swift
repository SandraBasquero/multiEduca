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

    func getHomeData(completion: @escaping ([HomeDataModel]?, NSError?) -> Void)
    {
        var data:[HomeDataModel]? = nil
        var error:NSError? = nil
        if !fileManager.readHomeDataFile().isEmpty {
            cache.saveData(fileManager.readHomeDataFile(), forKey: Constants.homeData)
            data = cache.getData(forKey: Constants.homeData)
        } else {
            if (cache.getData(forKey: Constants.homeData) != nil) {
                data = cache.getData(forKey: Constants.homeData)
            } else {
                error = NSError()
            }
        }
        completion(data, error)
    }
}
