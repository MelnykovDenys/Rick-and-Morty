//
//  UIAlertController+Ext.swift
//  Rick and Morty
//
//  Created by Mac on 08.12.2020.
//

import Foundation
import UIKit

extension UIAlertController {
    
    static func errorAlert(with message: String?) -> UIAlertController {
        let alert = UIAlertController(title: "Error".localized,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok".localized, style: .default, handler: nil)
        alert.addAction(okAction)
        
        return alert
    }
}

