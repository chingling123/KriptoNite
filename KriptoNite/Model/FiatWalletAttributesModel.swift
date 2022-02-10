//
//  FiatWalletAttributesModel.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation

struct FiatWalletAttributesModel: Codable {
    var fiatId: String
    var fiatSymbol: String
    var balance: String
    var name: String
    var pendingTransactionsCount: Int
}
