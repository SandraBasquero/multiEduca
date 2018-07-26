//
//  HomeRouter.swift
//  MultiEduca
//
//  Created by Sandra on 17/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter {
    
    let view:UIViewController
    
    init(view:HomeViewContract) {
        self.view = view as! UIViewController
    }
}


extension HomeRouter: HomeRouterContract {
    
    func navigateToLevelsOfSection(_ section: SectionCellViewModel)
    {
        let levels = DependencyFactory.createModuleWithData(type: .LEVELS_TYPE, data: section)
        view.navigationController?.pushViewController(levels, animated: true)
    }
}
