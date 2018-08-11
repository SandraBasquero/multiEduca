//
//  TitleCollectionViewCell.swift
//  MultiEduca
//
//  Created by Sandra on 5/8/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleCell: UILabel!
    
    static let identifier = "levelCell"
    
    static func registerCellForCollectionView(_ collectionView:UICollectionView)
    {
        collectionView.register(UINib.init(nibName: "TitleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifier)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleCell.textColor = UIColor.darkGray
        titleCell.font = UIFont(name: Constants.Styles.primaryFont, size: 20)
    }
}
