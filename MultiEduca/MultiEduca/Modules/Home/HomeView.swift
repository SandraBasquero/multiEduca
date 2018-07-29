//
//  ViewController.swift
//  MultiEduca
//
//  Created by Sandra on 12/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import UIKit


class HomeView: BaseViewController<HomePresenter>, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var sectionsArray:[SectionCellViewModel]?
    let cellIdentifier = "sectionCell"

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.presenter.start()
    }
    
    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews()
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.sectionsArray?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        return self.renderCell(index: indexPath)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        presenter.sectionSelected(viewModelSection: sectionsArray![indexPath.row])
    }
}


//-----------------------
// MARK: HomeViewContract
//-----------------------
extension HomeView: HomeViewContract {
    
    func prepareView()
    {
        self.setupView()
    }
    
    
    func renderSectionCells(sections: [SectionCellViewModel])
    {
        self.sectionsArray = sections
    }
    
    
    func showAlert(title: String?, message: String?)
    {
        self.showSimpleAlert(title: title, message: message, buttonText: "home_error_button".localized) { (alert) in
            exit(0)
        }
    }
}



