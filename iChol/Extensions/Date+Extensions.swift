//
//  Date+Extensions.swift
//  iChol
//
//  Created by Windy on 02/11/20.
//

import Foundation

extension Date {
    
    func convertToString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMM yyyy"
        
        return formatter.string(from: self)
    }
    
}
