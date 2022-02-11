//
//  WalletAttributesModel.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation

struct WalletAttributesModel: Codable {
    var cryptocoinId: String
    var cryptocoinSymbol: String
    var isDefault: Bool
    var name: String
    var pendingTransactionsCount: Int
    var deleted: Bool
    var balance: String
}
