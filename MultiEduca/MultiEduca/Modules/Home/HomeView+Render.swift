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
    }
    

    func renderCell(index:IndexPath) -> UICollectionViewCell
    {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: index) as! SectionCell
        cell.name?.text = self.sectionsArray![index.row].name
        cell.image?.image = self.sectionsArray![index.row].image
        return cell
    }
    
    
    func setCellSize() -> CGSize
    {
        let cellWidth:Int
        let cellHeight:Int
        if self.sectionsArray?.count == 1 {
            cellWidth = Int(self.collectionView.frame.width)
            cellHeight = Int(self.collectionView.frame.height)
        } else if self.sectionsArray?.count == 2 {
            cellWidth = Int(self.collectionView.frame.width)
            cellHeight = Int(self.collectionView.frame.height)/2
        } else {
            cellWidth = Int(self.collectionView.frame.width)/2
            cellHeight = cellWidth
        }
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}



