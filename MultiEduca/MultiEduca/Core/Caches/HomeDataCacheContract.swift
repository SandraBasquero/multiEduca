//
//  HomeDataCacheContract.swift
//  MultiEduca
//
//  Created by Sandra on 27/7/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation


protocol HomeDataCacheContract {
    func saveData(_ data:[HomeDataModel], forKey:String)
    func getData(forKey:String) -> [HomeDataModel]?
}
