//
//  DateFormatter+Ext.swift
//  Rick and Morty
//
//  Created by Mac on 08.12.2020.
//

import Foundation

extension DateFormatter {
    
    static func formatISO(date: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        guard let date = dateFormatter.date(from: date) else { return nil }
        dateFormatter.dateFormat = "MM-dd-yyyy"
        return dateFormatter.string(from: date)
    }
}
