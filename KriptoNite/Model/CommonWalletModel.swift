//
//  CommonWalletModel.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 13/02/2022.
//

import Foundation
import UIKit

struct CommonWalletModel {
    var id: String
    var name: String
    var symbol: String
    var logoDark: String?
    var logo: String?
    var balance: String
    var isDefault: Bool
    var type: AttributesType
    var color: UIColor
}
