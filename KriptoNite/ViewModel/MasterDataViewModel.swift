//
//  MasterDataViewModel.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation

class MasterDataViewModel {
    weak var view: CriptosViewProtocol?
    private var masterData: MasterDataModel?
    private var filter: AttributesType?
    
    private func fetch() {
        guard let data = FileLoader.loadData() else { return }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            masterData = try decoder.decode(MasterDataModel.self, from: data)
        } catch {
            print("Failed to decode JSON")
        }
    }
}

extension MasterDataViewModel: CriptosViewModelProtocol {
    var criptoData: [CriptoModel]? {
        guard let hasData = masterData else { return nil }
        if filter != nil {
            switch filter {
            case .cryptocoin:
                return hasData.mainData.attributes.cryptocoins
            case .commodity:
                return hasData.mainData.attributes.commodities
            case .fiat:
                return hasData.mainData.attributes.fiats.filter { $0.attributes.hasWallets == true }
            default:
                return nil
            }
        } else {
            return hasData.mainData.attributes.cryptocoins + hasData.mainData.attributes.commodities + hasData.mainData.attributes.fiats.filter { $0.attributes.hasWallets == true }
        }
    }
    
    var commonWalletData: [WalletModel]? {
        guard let hasData = masterData else { return nil }
        return  hasData.mainData.attributes.wallets.filter { $0.attributes.deleted == false }.sorted { $0.attributes.balance > $1.attributes.balance } +
                hasData.mainData.attributes.commodityWallets.filter { $0.attributes.deleted == false }.sorted { $0.attributes.balance > $1.attributes.balance }
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
