//
//  HomeNavigationBarButton.swift
//  MultiEduca
//
//  Created by Sandra on 1/11/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import UIKit

class HomeNavigationBarButton: UIButton {
    
    static func instantiate() -> HomeNavigationBarButton {
        let button = HomeNavigationBarButton()
        button.setImage(UIImage(named: "Home"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        return button
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 0, left: (bounds.width - 35), bottom: 2, right: 0)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)
        }
    }
}
