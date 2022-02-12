//
//  AttributesModel.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation
import UIKit

enum AttributesType: String, Codable {
    case cryptocoin
    case commodity
    case fiat
    case wallet
    case fiatWallet = "fiat_wallet"
    
    var color: UIColor {
        switch self {
        case .fiat:
            return UIColor(named: "fiat") ?? .yellow
        case .cryptocoin:
            return UIColor(named: "cryptocoin") ?? .green
        case .commodity:
            return UIColor(named: "commodity") ?? .cyan
        default:
            return UIColor(named: "generalLabel") ?? .systemBackground
        }
    }
}
struct AttributesModel: Codable {
    var cryptocoins: [CriptoModel]
    var commodities: [CriptoModel]
    var fiats: [CriptoModel]
    var wallets: [WalletModel]
    var commodityWallets: [WalletModel]
    var fiatwallets: [FiatWalletModel]
}
