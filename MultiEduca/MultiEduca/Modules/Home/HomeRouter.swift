//
//  HomeRouter.swift
//  MultiEduca
//
//  Created by Sandra on 17/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter: HomeRouterContract {
    
    let view:HomeViewContract
    
    init(view:HomeViewContract) {
        self.view = view
    }
    
}
