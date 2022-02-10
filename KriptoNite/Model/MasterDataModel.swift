//
//  MasterDataModel.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation

struct MasterDataModel: Codable {
    var mainData: MainDataModel
    
    private enum CodingKeys: String, CodingKey {
        case mainData = "data"
    }
}
