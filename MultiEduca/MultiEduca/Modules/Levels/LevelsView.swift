//
//  LevelsView.swift
//  MultiEduca
//
//  Created by Sandra on 25/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import UIKit


class LevelsView: UIViewController {
    
    let presenter = DependencyFactory.moduleDependencies(moduleType: .LEVELS_TYPE, view: self as! LevelsViewContract)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}


extension LevelsView:LevelsViewContract {
    
}
