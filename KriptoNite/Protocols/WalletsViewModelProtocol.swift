//
//  WalletsViewModelProtocol.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 12/02/2022.
//

import Foundation


protocol WalletsViewModelProtocol: AnyObject {
    var view: WalletsViewProtocol? { get set }
    var commodityWalletData: [WalletModel]? { get }
    var walletData: [WalletModel]? { get }
    var fiatWalletData: [FiatWalletModel]? { get }
    func fetchData(filter: AttributesType?)
}
