//
//  AttributesModel.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation

enum AttributesType: String, Codable {
    case cryptocoin
    case commodity
    case fiat
    case wallet
    case fiatWallet = "fiat_wallet"
}
struct AttributesModel: Codable {
    var cryptocoins: [CriptoModel]
    var commodities: [CriptoModel]
    var fiats: [FiatModel]
    var wallets: [WalletModel]
    var commodityWallets: [WalletModel]
    var fiatwallets: [FiatWalletModel]
}
