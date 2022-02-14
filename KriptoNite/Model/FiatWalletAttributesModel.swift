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
    var balance: Float
    var name: String
    var pendingTransactionsCount: Int
    
    private enum CodingKeys : String, CodingKey {
        case fiatId
        case fiatSymbol
        case balance
        case name
        case pendingTransactionsCount
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let stringValue = try container.decode(String.self, forKey: .balance)
        guard let balance = Float(stringValue) else {
            throw DecodingError.dataCorruptedError(forKey: .balance, in: container, debugDescription: "Invalid numeric value.")
        }
        self.balance = balance
        fiatId = try container.decode(String.self, forKey: .fiatId)
        fiatSymbol = try container.decode(String.self, forKey: .fiatSymbol)
        name = try container.decode(String.self, forKey: .name)
        pendingTransactionsCount = try container.decode(Int.self, forKey: .pendingTransactionsCount)
    }
}
