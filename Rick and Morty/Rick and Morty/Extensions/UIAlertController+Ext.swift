//
//  UIAlertController+Ext.swift
//  Rick and Morty
//
//  Created by Mac on 08.12.2020.
//

import Foundation
import UIKit

extension UIAlertController {
    
    static func errorAlert(with message: String? = nil) -> UIAlertController {
        let alert = UIAlertController(title: "Error",
                                      message: message ?? "Sorry, server is not available now, please try again later",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        
        return alert
    }
}

