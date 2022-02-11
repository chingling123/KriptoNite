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
    var commonWalletData: [WalletModel]? { get }
    var fiatWalletData: [FiatWalletModel]? { get }
    func fetchData(filter: AttributesType?)
}
