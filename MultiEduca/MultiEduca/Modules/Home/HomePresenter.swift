//
//  HomePresenter.swift
//  MultiEduca
//
//  Created by Sandra on 17/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation
import UIKit

final class HomePresenter {
    
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
        self.view.prepareView()
        if let data = interactor.getHomeData() {
            self.view.renderSectionCells(sections: modelToViewModelMapper(input: data))
        } else {
            self.view.showAlert(title: nil, message: "home_error_message".localized)
        }
    }
    
    
    func sectionSelected(viewModelSection: SectionCellViewModel)
    {
        router.navigateToLevelsOfSection(viewModelSection)
    }
}


extension HomePresenter {

    fileprivate func modelToViewModelMapper(input:[HomeDataModel]) -> [SectionCellViewModel]
    {
        var cells:[SectionCellViewModel] = []
        for model in input {
            cells.append(SectionCellViewModel(id: model.id!, name: model.name!, image: (model.imageBase64?.base64ToImage())!))
        }
        return cells
    }
}
