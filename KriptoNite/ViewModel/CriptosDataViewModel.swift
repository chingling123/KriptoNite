//
//  MasterDataViewModel.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation

class CriptosDataViewModel {
    weak var view: CriptosViewProtocol?
    private var masterData: MasterDataModel?
    private var filter: AttributesType?
    
    private func fetch() {
        DataFetcher.fetch { [weak self] resultData in
            self?.masterData = resultData
        }
    }
}

extension CriptosDataViewModel: CriptosViewModelProtocol {
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
    
    func fetchData(filter: AttributesType?) {
        self.filter = filter
        fetch()
        view?.refresh()
    }
}
