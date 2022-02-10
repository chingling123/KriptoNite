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
    var data: MasterDataModel? {
        return masterData
    }
    
    func fetchData() {
        fetch()
    }
}
