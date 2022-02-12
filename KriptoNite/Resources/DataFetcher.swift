//
//  DataFetcher.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 12/02/2022.
//

import Foundation

class DataFetcher {
    static func fetch(completion: @escaping (MasterDataModel?) -> Void) {
        guard let data = FileLoader.loadData() else {
            completion(nil)
            return
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let masterData = try decoder.decode(MasterDataModel.self, from: data)
            completion(masterData)
        } catch {
            completion(nil)
        }
    }
}
