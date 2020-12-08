//
//  String+Ext.swift
//  Rick and Morty
//
//  Created by Mac on 08.12.2020.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
