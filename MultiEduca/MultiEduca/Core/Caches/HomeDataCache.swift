//
//  HomeDataCache.swift
//  MultiEduca
//
//  Created by Sandra on 27/7/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation


class HomeDataCache {
    
    var userDefaults = UserDefaults.standard
}


extension HomeDataCache: HomeDataCacheContract {
    
    func saveData(_ data: [HomeDataModel], forKey: String)
    {
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: data)
        userDefaults.set(encodedData, forKey: forKey)
        userDefaults.synchronize()
    }
    
    func getData(forKey: String) -> [HomeDataModel]?
    {
        let decoded = userDefaults.object(forKey: forKey) != nil ? userDefaults.object(forKey: forKey) as? Data : nil
        if (decoded != nil) {
            return NSKeyedUnarchiver.unarchiveObject(with: decoded!) as? [HomeDataModel]
        } else {
            return nil
        }
    }

}
