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
    @IBOutlet private var maxWidthConstraint: NSLayoutConstraint! {
        didSet {
            maxWidthConstraint.isActive = false
        }
    }
    
    static let identifier = "OneTextGameCellCollectionViewCell"
    
    static func registerCellForCollectionView(_ collectionView:UICollectionView)
    {
        collectionView.register(UINib.init(nibName: "OneTextGameCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifier)
    }
    
    var maxWidth: CGFloat? = nil {
        didSet {
            guard let maxWidth = maxWidth else {
                return
            }
            maxWidthConstraint.isActive = true
            maxWidthConstraint.constant = maxWidth
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
    func setData(text: String) {
        self.text.text = text
    }

}
