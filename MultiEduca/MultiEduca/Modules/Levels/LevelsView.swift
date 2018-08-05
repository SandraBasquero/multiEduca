//
//  LevelsView.swift
//  MultiEduca
//
//  Created by Sandra on 25/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import UIKit


class LevelsView: BaseViewController<LevelsPresenter> {
    
    private var sectionSelectedData:SectionCellViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.start()
    }

    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    }
    
    
    func setData(data:SectionCellViewModel)
    {
        sectionSelectedData = data
    }
}


extension LevelsView:LevelsViewContract {
    
    func prepareViews()
    {
        setupViews()
    }
}


extension LevelsView {
    
    func setupViews()
    {
        self.navigationItem.title = sectionSelectedData?.name.uppercased()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.darkGray, NSAttributedStringKey.font: UIFont(name: "DINAlternate-Bold", size: 22)!]
    }
}

