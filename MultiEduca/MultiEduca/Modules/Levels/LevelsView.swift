//
//  LevelsView.swift
//  MultiEduca
//
//  Created by Sandra on 25/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import UIKit


class LevelsView: BaseViewController<LevelsPresenter> {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.start()
    }

    
    func setData(data:SectionCellViewModel)
    {
        print(data.id)
        print(data.name)
    }
}


extension LevelsView:LevelsViewContract {
    
}
