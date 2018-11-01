//
//  BaseViewController.swift
//  MultiEduca
//
//  Created by Sandra on 30/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import UIKit

@objc protocol BaseViewControllerDelegate: class {
    @objc func homeButtonPressed()
}

class BaseViewController<P: PresenterContractBase>: UIViewController {

    var presenter:P!
    var homeBarButton: UIBarButtonItem!
    weak var delegate: BaseViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeButton = HomeNavigationBarButton.instantiate()
        homeBarButton = UIBarButtonItem(customView: homeButton)
        homeButton.addTarget(self, action: #selector(delegate?.homeButtonPressed), for: .touchUpInside)
    }
    
    func showHomeButtonOnNavigationBar(_ show: Bool) {
        if show {
            navigationItem.setRightBarButtonItems([homeBarButton], animated: false)
        } else {
            navigationItem.rightBarButtonItems?.removeAll()
        }
    }
}
