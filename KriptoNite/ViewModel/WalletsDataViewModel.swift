//
//  WalletsDataViewModel.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 12/02/2022.
//

import Foundation

class WalletsDataViewModel {
    weak var view: WalletsViewProtocol?
    private var masterData: MasterDataModel?
    private var filter: AttributesType?
    
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
    func fetchData(filter: AttributesType?) {
        self.filter = filter
        fetch()
        view?.refresh()
    }
}
