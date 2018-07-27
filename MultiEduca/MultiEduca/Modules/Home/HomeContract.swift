//
//  HomeContracts.swift
//  MultiEduca
//
//  Created by Sandra on 17/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation


protocol HomeViewContract:ViewContractBase {
    func prepareView()
    func renderSectionCells(sections:[SectionCellViewModel])
}

protocol HomePresenterContract:PresenterContractBase {
    func sectionSelected(viewModelSection:SectionCellViewModel)
}


protocol HomeInteractorContract {
    func getHomeData() -> [HomeDataModel]
}


protocol HomeRouterContract {
    func navigateToLevelsOfSection(_  section:SectionCellViewModel)
}
