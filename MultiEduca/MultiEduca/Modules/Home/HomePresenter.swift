//
//  HomePresenter.swift
//  MultiEduca
//
//  Created by Sandra on 17/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation
import UIKit

class HomePresenter {
    
    let view:HomeViewContract
    let router:HomeRouterContract
    let interactor:HomeInteractorContract
    
    init(view:HomeViewContract, router:HomeRouterContract, interactor:HomeInteractorContract) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}


extension HomePresenter: HomePresenterContract{
    
    func start()
    {
        print("Testiiiing Home")
        self.view.prepareView()
        
        // Get sections name and images and build [SectionCellViewModel] here -> from a json file?
        // Mapper y demás...
        let section1 = SectionCellViewModel(id: "1", name: "Sección 1", image:  UIImage(named: "testImage")!)
        let section2 = SectionCellViewModel(id: "2", name: "Sección 2", image: UIImage(named: "testImage")!)
        let section3 = SectionCellViewModel(id: "3", name: "Sección 3", image: UIImage(named: "testImage")!)
        let section4 = SectionCellViewModel(id: "4", name: "Sección 4", image: UIImage(named: "testImage")!)
        let testSections:[SectionCellViewModel] = [section1, section2, section3]
        
        self.view.renderSectionCells(sections: testSections)
        
        // Call renderSectionCells(sections:[SectionCellViewModel]) here when completion
        
    }
    
    
    func sectionSelected(viewModelSection: SectionCellViewModel)
    {
        router.navigateToLevelsOfSection(viewModelSection)
    }
}
