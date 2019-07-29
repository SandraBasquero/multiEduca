//
//  OneTextGameCellCollectionViewCell.swift
//  MultiEduca
//
//  Created by Sandra on 12/07/2019.
//  Copyright © 2019 Sandra. All rights reserved.
//

import UIKit

class OneTextGameCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var text: UILabel!
    
    static let identifier = "OneTextGameCellCollectionViewCell"
    
    static func registerCellForCollectionView(_ collectionView:UICollectionView)
    {
        collectionView.register(UINib.init(nibName: "OneTextGameCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifier)
    }
    
   static func calculateCellSize(collectionViewWidth: CGFloat, totalInfo: [String]) -> CGSize {
    //TOOD: calculate cell width also according to screen devices width.
        var maxLenght = 0
        totalInfo.forEach {
            maxLenght = $0.count > maxLenght ? $0.count : maxLenght
        }
        let cellWidth = maxLenght > 6 ? collectionViewWidth / 2 : collectionViewWidth / 3
        return CGSize(width: cellWidth, height: 100)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.gray.cgColor
        layer.cornerRadius = 10
    }
    
    func setData(text: String) {
        self.text.text = text
    }

}
