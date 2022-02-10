//
//  MasterDataViewModel.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation

class MasterDataViewModel {
    private var masterData: MasterDataModel?
    
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
        return hasData.mainData.attributes.cryptocoins + hasData.mainData.attributes.commodities + hasData.mainData.attributes.fiats.filter { $0.attributes.hasWallets == true }
    }
    
    func fetchData() {
        fetch()
    }
}
