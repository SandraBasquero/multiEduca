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
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    //MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.sectionsArray?.count ?? 0
    }
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        return self.renderCell(index: indexPath)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        print("\(indexPath.row + 1) selected")
    }
    
    //MARK: UICollectionViewDelegate
    
    

    //MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return self.setCellSize()
    }
}


extension HomeView: HomeViewContract {
    
    func prepareView()
    {
        self.setupView()
    }
    
    
    func renderSectionCells(sections: [SectionCellViewModel])
    {
        self.sectionsArray = sections
    }
}



