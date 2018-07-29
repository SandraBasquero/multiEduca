//
//  AlertControllerExtensions.swift
//  MultiEduca
//
//  Created by Sandra on 28/7/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showSimpleAlert(title:String?, message:String?, buttonText:String, completion:@escaping(UIAlertAction)->Void)
    {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: buttonText, style: .default) { (action) in
            completion(action)
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
}
