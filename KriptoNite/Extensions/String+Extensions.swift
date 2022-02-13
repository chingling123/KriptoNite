//
//  String+Extensions.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation

extension String {
    func currencyFormat(maximumFractionDigits: Int, currencyCode: String? = nil) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = maximumFractionDigits
        if let currencyCode = currencyCode {
            numberFormatter.currencyCode = currencyCode
        }
        guard let hasFloat = Float(self), let currency = numberFormatter.string(from: NSNumber(value: hasFloat)) else { return self }
        return currency
    }
}
