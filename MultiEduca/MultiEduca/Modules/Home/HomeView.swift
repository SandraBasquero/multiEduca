//
//  ViewController.swift
//  MultiEduca
//
//  Created by Sandra on 12/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import UIKit

class HomeView: UIViewController {

    var presenter = DependencyFactory.moduleDependencies(moduleType: .HOME_TYPE, view: self as! HomeViewContract) as! HomePresenterContract
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension HomeView:HomeViewContract {
    
}
