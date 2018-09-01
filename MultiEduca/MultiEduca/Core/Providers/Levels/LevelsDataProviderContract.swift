//
//  LevelsDataProviderContract.swift
//  MultiEduca
//
//  Created by Sandra on 19/8/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation

protocol LevelsDataProviderContract {
    func getLevelsOfGame(id:String, completion:@escaping([Int]?,NSError?)->Void)
    func getLevelIdOfIndex(_ index:Int, ofGame:String) -> String
}
