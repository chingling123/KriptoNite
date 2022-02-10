//
//  CryptocoinsModel.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation

struct CryptocoinsModel: Codable {
    var type: String
    var attributes: CryptocoinsAttributesModel
    var id: String
}
