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
    var balance: Float
    
    private enum CodingKeys: String, CodingKey {
        case cryptocoinId
        case cryptocoinSymbol
        case isDefault
        case name
        case pendingTransactionsCount
        case deleted
        case balance
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let stringValue = try container.decode(String.self, forKey: .balance)
        guard let floatBalance = Float(stringValue) else {
            throw DecodingError.dataCorruptedError(forKey: .balance, in: container, debugDescription: "Invalid numeric value.")
        }
        balance = floatBalance
        cryptocoinId = try container.decode(String.self, forKey: .cryptocoinId)
        cryptocoinSymbol = try container.decode(String.self, forKey: .cryptocoinSymbol)
        isDefault = try container.decode(Bool.self, forKey: .isDefault)
        name = try container.decode(String.self, forKey: .name)
        pendingTransactionsCount = try container.decode(Int.self, forKey: .pendingTransactionsCount)
        deleted = try container.decode(Bool.self, forKey: .deleted)
    }
}
