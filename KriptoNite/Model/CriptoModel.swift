//
//  CriptocoinsModel.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation

struct CriptoModel: Codable {
    var type: AttributesType
    var attributes: CriptoAttributesModel
    var id: String
}
