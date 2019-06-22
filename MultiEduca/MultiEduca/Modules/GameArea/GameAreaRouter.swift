//
//  GameAreaRouter.swift
//  MultiEduca
//
//  Created by Sandra on 27/10/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation
import UIKit


class GameAreaRouter {
    
    var view:UIViewController
    
    init(view:GameAreaViewContract) {
        self.view = view as! UIViewController
    }
}

extension GameAreaRouter: GameAreaRouterContract {
    
    func backToHomeMenu() {
        view.navigationController?.popToRootViewController(animated: true)
    }
    
    func backToLevels() {
        view.navigationController?.popViewController(animated: true)
    }
}
