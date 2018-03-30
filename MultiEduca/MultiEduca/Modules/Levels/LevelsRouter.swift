//
//  LevelsRouter.swift
//  MultiEduca
//
//  Created by Sandra on 25/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation


class LevelsRouter:LevelsRouterContract {
    
    var view:LevelsViewContract
    
    init(view:LevelsViewContract) {
        self.view = view
    }
}
