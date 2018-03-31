//
//  ViewController.swift
//  MultiEduca
//
//  Created by Sandra on 12/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import UIKit


class HomeView: BaseViewController<HomePresenter> {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.presenter.start()
    }
}


extension HomeView: HomeViewContract {
    
    func renderSectionCells(sections: [SectionCellViewModel]) {
        
    }
    
}
