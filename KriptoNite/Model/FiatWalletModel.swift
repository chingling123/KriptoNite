//
//  FiatWalletModel.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation

struct FiatWalletModel: Codable {
    var type: AttributesType
    var attributes: FiatWalletAttributesModel
    var id: String
}
