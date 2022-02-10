//
//  MasterDataViewModel.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation

class MasterDataViewModel {
    var masterData: MasterDataModel?
    
    func fetchData() {
        guard let data = FileLoader.loadData() else { return }
        let decoder = JSONDecoder()
        
        do {
            masterData = try decoder.decode(MasterDataModel.self, from: data)
        } catch {
            print("Failed to decode JSON")
        }
    }
}
