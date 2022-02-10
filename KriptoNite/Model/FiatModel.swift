//
//  FiatModel.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation

struct FiatModel: Codable {
    var type: String
    var attributes: FiatAttributesModel
    var id: String
}
