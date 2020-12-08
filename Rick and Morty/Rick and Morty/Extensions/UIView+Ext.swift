//
//  UIView+Ext.swift
//  Rick and Morty
//
//  Created by Mac on 08.12.2020.
//

import Foundation
import UIKit

extension UIView {
    
    func pinToEdges(_ view: UIView) {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
