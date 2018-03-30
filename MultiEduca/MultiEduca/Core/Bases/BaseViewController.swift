//
//  BaseViewController.swift
//  MultiEduca
//
//  Created by Sandra on 30/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import UIKit

class BaseViewController<P:PresenterContractBase>: UIViewController {

    var presenter:P!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
