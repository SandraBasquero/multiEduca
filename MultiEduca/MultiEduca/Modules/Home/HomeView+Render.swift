//
//  HomeView+Render.swift
//  MultiEduca
//
//  Created by Sandra on 1/4/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation
import UIKit



extension HomeView {
 
    func setupView()
    {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        layout.itemSize = self.setCellSize()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 15
        collectionView!.collectionViewLayout = layout
        self.navigationItem.title = "home_bar_title".localized
    }
    

    func renderCell(index:IndexPath) -> UICollectionViewCell
    {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: index) as! SectionCell
        cell.layer.cornerRadius = 10
        let shadowPath2 = UIBezierPath(rect: cell.bounds)
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: CGFloat(3.0), height: CGFloat(3.0))
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowPath = shadowPath2.cgPath
        cell.name?.text = self.sectionsArray![index.row].name
        cell.image?.image = self.sectionsArray![index.row].image
        return cell
    }
    
    
    func setCellSize() -> CGSize
    {
        let cellWidth:Int
        let cellHeight:Int
//        if self.sectionsArray?.count == 1 {
//            cellWidth = Int(self.collectionView.frame.width)
//            cellHeight = Int(self.collectionView.frame.height)
//        } else if self.sectionsArray?.count == 2 {
//            cellWidth = Int(self.collectionView.frame.width)
//            cellHeight = Int(self.collectionView.frame.height)/2
//        } else {
//            cellWidth = (Int(self.collectionView.frame.width)/2) - 10
//            cellHeight = cellWidth
//        }
        cellWidth = (Int(self.collectionView.frame.width)/2) - 10
        cellHeight = cellWidth
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}



