//
//  Double+Extensions.swift
//  Picho
//
//  Created by Wendy Kurniawan on 10/11/20.
//

import UIKit

extension Optional where Wrapped == String {
    func convertToDouble() -> Double {
        return Double(self ?? "0.0") ?? 0.0
    }
}
