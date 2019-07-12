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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(text: String) {
        self.text.text = text
    }

}
