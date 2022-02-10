//
//  WalletModel.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation

struct WalletModel: Codable {
    var type: String
    var attributes: WalletAttributesModel
    var id: String
}
