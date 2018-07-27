//
//  UIImageExtensions.swift
//  MultiEduca
//
//  Created by Sandra on 27/7/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func base64ToImage() -> UIImage
    {
        var image:UIImage!
        let dataDecoded : Data = Data(base64Encoded: self, options: .ignoreUnknownCharacters)!
        image = UIImage(data: dataDecoded)
        return image
    }
    
}
