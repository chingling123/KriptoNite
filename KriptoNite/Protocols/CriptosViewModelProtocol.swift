//
//  CriptosViewModelProtocol.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation

protocol CriptosViewModelProtocol: AnyObject {
    var view: CriptosViewProtocol? { get set }
    var data: [CriptoModel]? { get }
    func fetchData(filter: AttributesType?)
}
