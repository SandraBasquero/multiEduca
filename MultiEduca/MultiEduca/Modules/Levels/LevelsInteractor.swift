//
//  LevelsInteractor.swift
//  MultiEduca
//
//  Created by Sandra on 25/8/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation


final class LevelsInteractor {
    
    let provider:LevelsDataProviderContract
    
    init(provider:LevelsDataProviderContract)
    {
        self.provider = provider
    }
}


extension LevelsInteractor: LevelsInteractorContract {
    
    
    func getLevelsOfGame(gameId: String) -> [Int]?
    {
        var data:[Int]?
        provider.getLevelsOfGame(id: gameId) { (levels, error) in
            if error == nil {
                if let gameLevels = levels {
                    data = gameLevels
                } else {
                    data = nil
                }
            } else {
                data = nil
            }
        }
        return data
    }
}
