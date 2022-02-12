//
//  CriptosViewModelProtocol.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation

protocol CriptosViewModelProtocol: AnyObject {
    var view: CriptosViewProtocol? { get set }
    var criptoData: [CriptoModel]? { get }
    func fetchData(filter: AttributesType?)
}
