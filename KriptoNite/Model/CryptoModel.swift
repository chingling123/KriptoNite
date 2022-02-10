//
//  CryptocoinsModel.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation

struct CryptoModel: Codable {
    var type: String
    var attributes: CryptoAttributesModel
    var id: String
}
