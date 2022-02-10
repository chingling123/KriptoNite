//
//  CriptosViewModelProtocol.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation

protocol CriptosViewModelProtocol {
    var data: [CriptoModel]? { get }
    func fetchData()
}
