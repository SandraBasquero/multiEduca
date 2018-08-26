//
//  LevelsRouter.swift
//  MultiEduca
//
//  Created by Sandra on 25/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation
import UIKit


class LevelsRouter {
    
    var view:UIViewController
    
    init(view:LevelsViewContract) {
        self.view = view as! UIViewController
    }
}


extension LevelsRouter: LevelsRouterContract {
    
    func navigateBackHomeMenu()
    {
        view.navigationController?.popToRootViewController(animated: true)
    }
}
