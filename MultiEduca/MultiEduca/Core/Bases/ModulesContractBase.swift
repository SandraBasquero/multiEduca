//
//  ModulesContractBase.swift
//  MultiEduca
//
//  Created by Sandra on 17/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation


protocol ViewContractBase {
    func showAlert(title:String?, message:String?)
}

protocol PresenterContractBase {
    func start()
}

