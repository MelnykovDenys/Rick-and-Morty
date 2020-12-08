//
//  DateFormatter+Ext.swift
//  Rick and Morty
//
//  Created by Mac on 08.12.2020.
//

import Foundation

extension DateFormatter {
    
    func formatISO(date: String) -> String {
        dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        guard let date = self.date(from: date) else { return "uknown" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        return dateFormatter.string(from: date)
    }
}
