//
//  Float+Extensions.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 14/02/2022.
//

import Foundation

extension Float {
    func humberFormat(maximumFractionDigits: Int? = nil, currencyCode: String? = nil) -> String {
        let value = NSNumber(value: self)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        if let maximumFraction = maximumFractionDigits {
            numberFormatter.maximumFractionDigits = maximumFraction
        }
        if let currencyCode = currencyCode {
            numberFormatter.currencyCode = currencyCode
        }
        if let result = numberFormatter.string(from: value) {
            return result
        }
        return String(format: "%@.02f", self)
    }
}
