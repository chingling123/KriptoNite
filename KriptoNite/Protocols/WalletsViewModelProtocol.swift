//
//  WalletsViewModelProtocol.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 12/02/2022.
//

import Foundation


protocol WalletsViewModelProtocol: AnyObject {
    func fetchData(by type: WalletsType) -> [CommonWalletModel]?
    func walletListTypes() -> [WalletsType]
}
