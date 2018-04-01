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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: index) as! SectionCell
        cell.name?.text = sectionsArray![index.row].name
        cell.image?.image = sectionsArray![index.row].image
        return cell
    }
    
    
    func setCellSize() -> CGSize
    {
        let cellWidht = Int(self.collectionView.frame.width)/2
        return CGSize(width: cellWidht, height: cellWidht)
    }
}



