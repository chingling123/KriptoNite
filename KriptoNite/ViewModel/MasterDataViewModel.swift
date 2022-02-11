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
    var data: [CriptoModel]? {
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
