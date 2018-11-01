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
        button.setImage(UIImage(named: "testImage"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        return button
    }
    
}
