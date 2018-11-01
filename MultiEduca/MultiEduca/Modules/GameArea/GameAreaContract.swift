//
//  GameAreaContract.swift
//  MultiEduca
//
//  Created by Sandra on 1/9/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation


protocol GameAreaViewContract:ViewContractBase {
    func setupViews()
}

protocol GameAreaPresenterContract: PresenterContractBase {
    func backToHomeMenu()
}

protocol GameAreaInteractorContract {
    
}

protocol GameAreaRouterContract {
    func backToHomeMenu()
}
