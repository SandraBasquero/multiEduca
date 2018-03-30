//
//  HomePresenter.swift
//  MultiEduca
//
//  Created by Sandra on 17/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation


class HomePresenter: HomePresenterContract {
    
    let view:HomeViewContract
    let router:HomeRouterContract
    
    init(view:HomeViewContract, router:HomeRouterContract) {
        self.view = view
        self.router = router
    }
    
    
    func start()
    {
        print("Testiiiing Home")
    }
    
}
