//
//  BasePageViewController.swift
//  MultiEduca
//
//  Created by Sandra on 9/12/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import UIKit

@objc protocol BasePageViewControllerDelegate: class {
    @objc func homeButtonPressed()
}

class BasePageViewController<P: PresenterContractBase>: UIPageViewController {
    
    var presenter:P!
    var homeBarButton: UIBarButtonItem!
    weak var baseDelegate: BasePageViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeButton = HomeNavigationBarButton.instantiate()
        homeBarButton = UIBarButtonItem(customView: homeButton)
        homeButton.addTarget(self, action: #selector(baseDelegate?.homeButtonPressed), for: .touchUpInside)
    }
    
    func showHomeButtonOnNavigationBar(_ show: Bool) {
        if show {
            navigationItem.setRightBarButtonItems([homeBarButton], animated: false)
        } else {
            navigationItem.rightBarButtonItems?.removeAll()
        }
    }
}
