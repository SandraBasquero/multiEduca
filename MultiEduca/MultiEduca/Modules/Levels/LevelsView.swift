//
//  LevelsView.swift
//  MultiEduca
//
//  Created by Sandra on 25/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import UIKit


class LevelsView: BaseViewController<LevelsPresenter>,
    UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var sectionSelectedData:SectionCellViewModel?
    let cellIdentifier = "levelCell"
    
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
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 1
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! TitleCollectionViewCell
        cell.layer.cornerRadius = 10
        let shadowPath2 = UIBezierPath(rect: cell.bounds)
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: CGFloat(3.0), height: CGFloat(3.0))
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowPath = shadowPath2.cgPath
        cell.titleCell.text = "Nivel 1"
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
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
        
        TitleCollectionViewCell.registerCellForCollectionView(collectionView)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        layout.itemSize = self.setCellSize()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 15
        collectionView!.collectionViewLayout = layout
        collectionView.contentInset.top = max((collectionView.frame.height - collectionView.contentSize.height) / 3, 0) - (navigationController?.navigationBar.frame.size.height)!

    }
    
    
    func setCellSize() -> CGSize
    {
        let cellWidth:Int
        let cellHeight:Int
        cellWidth = (Int(self.collectionView.frame.width)/2)
        cellHeight = 50
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

