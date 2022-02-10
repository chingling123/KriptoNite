//
//  AttributesModel.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation

struct AttributesModel: Codable {
    var cryptocoins: [CryptoModel]
    var commodities: [CryptoModel]
    var fiats: [FiatModel]
    var wallets: [WalletModel]
    var commodityWallets: [WalletModel]
    var fiatwallets: [FiatWalletModel]
}
