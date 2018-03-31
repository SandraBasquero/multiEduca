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
    let interactor:HomeInteractorContract
    
    init(view:HomeViewContract, router:HomeRouterContract, interactor:HomeInteractorContract) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    
    func start()
    {
        print("Testiiiing Home")
        
        // Get sections name and images and build [SectionCellViewModel] here -> from a json file?
        
        // Call renderSectionCells(sections:[SectionCellViewModel]) here when completion
        
    }
    
}
