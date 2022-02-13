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
    
    init() {
        fetch()
    }
    
    private func fetch() {
        DataFetcher.fetch { [weak self] resultData in
            self?.masterData = resultData
        }
    }
}

private extension WalletsDataViewModel {
    private func getWalletData(type: WalletsType) -> [CommonWalletModel]? {
        switch type {
        case .fiat:
            return walletFromFiatWallets()
        case .crypto:
            return walletFromWallets()
        case .commodity:
            return walletFromCommodityWallets()
        }
    }
    
    private func walletFromFiatWallets() -> [CommonWalletModel]? {
        guard let hasData = masterData else { return nil }
        return hasData.mainData.attributes.fiatwallets.sorted { $0.attributes.balance > $1.attributes.balance }
        .map {
            let logos = findLogoBy(type: .fiat, symbol: $0.attributes.fiatSymbol)
            return CommonWalletModel(id: $0.id,
                                     name: $0.attributes.name,
                                     symbol: $0.attributes.fiatSymbol,
                                     logoDark: logos?[0], logo: logos?[1],
                                     balance: $0.attributes.balance,
                                     isDefault: false,
                                     type: $0.type,
                                     color: AttributesType.fiat.color)
            }
    }
    
    private func walletFromCommodityWallets() -> [CommonWalletModel]? {
        guard let hasData = masterData else { return nil }
        return hasData.mainData.attributes.commodityWallets.filter { $0.attributes.deleted == false }.sorted { $0.attributes.balance > $1.attributes.balance }.map {
            let logos = findLogoBy(type: .commodity, symbol: $0.attributes.cryptocoinSymbol)
            return CommonWalletModel(id: $0.id,
                                     name: $0.attributes.name,
                                     symbol: $0.attributes.cryptocoinSymbol,
                                     logoDark: logos?[0], logo: logos?[1],
                                     balance: $0.attributes.balance,
                                     isDefault: $0.attributes.isDefault,
                                     type: $0.type,
                                     color: AttributesType.cryptocoin.color)
            }
    }
    
    private func walletFromWallets() -> [CommonWalletModel]? {
        guard let hasData = masterData else { return nil }
        return hasData.mainData.attributes.wallets.filter { $0.attributes.deleted == false }.sorted { $0.attributes.balance > $1.attributes.balance }.map {
            let logos = findLogoBy(type: .crypto, symbol: $0.attributes.cryptocoinSymbol)
            return CommonWalletModel(id: $0.id,
                                     name: $0.attributes.name,
                                     symbol: $0.attributes.cryptocoinSymbol,
                                     logoDark: logos?[0], logo: logos?[1],
                                     balance: $0.attributes.balance,
                                     isDefault: $0.attributes.isDefault,
                                     type: $0.type,
                                     color: AttributesType.commodity.color)
            }
    }
    
    private func findLogoBy(type: WalletsType, symbol: String) -> [String]? {
        guard let hasData = masterData else { return nil }
        switch type {
        case .fiat:
            return hasData.mainData.attributes.fiats.filter { $0.attributes.symbol == symbol }.first.map {
                return [$0.attributes.logo, $0.attributes.logoDark]
            }
        case .crypto:
            return hasData.mainData.attributes.cryptocoins.filter { $0.attributes.symbol == symbol }.first.map {
                return [$0.attributes.logo, $0.attributes.logoDark]
            }
        case .commodity:
            return hasData.mainData.attributes.commodities.filter { $0.attributes.symbol == symbol }.first.map {
                return [$0.attributes.logo, $0.attributes.logoDark]
            }
        }
    }
}

extension WalletsDataViewModel: WalletsViewModelProtocol {
    func fetchData(by type: WalletsType) -> [CommonWalletModel]? {
        return getWalletData(type: type)
    }
    func walletListTypes() -> [WalletsType] {
        return WalletsType.allCases
    }
}
