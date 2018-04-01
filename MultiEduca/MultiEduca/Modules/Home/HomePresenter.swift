//
//  HomePresenter.swift
//  MultiEduca
//
//  Created by Sandra on 17/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation
import UIKit

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
        self.view.prepareView()
        
        // Get sections name and images and build [SectionCellViewModel] here -> from a json file?
        let section1 = SectionCellViewModel(name: "Sección 1", image:  UIImage(named: "testImage")!)
        let section2 = SectionCellViewModel(name: "Sección 2", image: UIImage(named: "testImage")!)
        let section3 = SectionCellViewModel(name: "Sección 3", image: UIImage(named: "testImage")!)
        let testSections:[SectionCellViewModel] = [section1, section2, section3]
        
        self.view.renderSectionCells(sections: testSections)
        
        // Call renderSectionCells(sections:[SectionCellViewModel]) here when completion
        
    }
    
}
