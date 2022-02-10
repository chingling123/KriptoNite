//
//  FiatAttributesModel.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation

struct FiatAttributesModel: Codable {
    var symbol: String
    var name: String
    var precision: Int
    var hasWallets: Bool
    var logo: String
    var logoDark: String
}
