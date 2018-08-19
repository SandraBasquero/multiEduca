//
//  GameContentCacheContract.swift
//  MultiEduca
//
//  Created by Sandra on 19/8/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation


protocol GameContentCacheContract {
    func saveData(_ data:GameContentModel)
    func getAllData() -> GameContentModel?
}
