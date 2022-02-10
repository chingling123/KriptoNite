//
//  CryptocoinsAttributesModel.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation

struct CryptocoinsAttributesModel: Codable {
    var symbol: String
    var name: String
    var avgPrice: String
    var precisionForFiatPrice: Int
    var logo: String
    var logoDark: String
}
