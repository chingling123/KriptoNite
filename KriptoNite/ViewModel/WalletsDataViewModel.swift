//
//  WalletsDataViewModel.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 12/02/2022.
//

import Foundation
import UIKit

enum WalletsType: String, CaseIterable {
    case fiat = "Fiat"
    case crypto = "Crypto"
    case commodity = "Commodity"
    
    var color: UIColor {
        switch self {
        case .fiat:
            return UIColor(named: "fiat") ?? .yellow
        case .crypto:
            return UIColor(named: "cryptocoin") ?? .green
        case .commodity:
            return UIColor(named: "commodity") ?? .cyan
        }
    }
}

class WalletsDataViewModel {
    private var masterData: MasterDataModel?
    
    private func fetch() {
        DataFetcher.fetch { [weak self] resultData in
            self?.masterData = resultData
        }
    }
}

extension WalletsDataViewModel: WalletsViewModelProtocol {
    var commodityWalletData: [WalletModel]? {
        guard let hasData = masterData else { return nil }
        return hasData.mainData.attributes.commodityWallets.filter { $0.attributes.deleted == false }.sorted { $0.attributes.balance > $1.attributes.balance }
    }
    
    var walletData: [WalletModel]? {
        guard let hasData = masterData else { return nil }
        return hasData.mainData.attributes.wallets.filter { $0.attributes.deleted == false }.sorted { $0.attributes.balance > $1.attributes.balance }
    }
    
    var fiatWalletData: [FiatWalletModel]? {
        guard let hasData = masterData else { return nil }
        return hasData.mainData.attributes.fiatwallets.sorted { $0.attributes.balance > $1.attributes.balance }
    }
    
    func fetchData() {
        fetch()
    }
    
    func walletList() -> [WalletsType] {
        return WalletsType.allCases
    }
}
