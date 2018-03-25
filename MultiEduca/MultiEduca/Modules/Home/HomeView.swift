//
//  ViewController.swift
//  MultiEduca
//
//  Created by Sandra on 12/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import UIKit


class HomeView: UIViewController {

    // TODO: usar generic para el tipo de protocolo o clase de la vista
    let presenter = DependencyFactory.moduleDependencies(moduleType: .HOME_TYPE, view: self as! HomeViewContract)
        
    override func viewDidLoad()
    {
        super.viewDidLoad() 
    }

}


extension HomeView: HomeViewContract {
    

}



