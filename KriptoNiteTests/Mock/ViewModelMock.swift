//
//  ViewModelMock.swift
//  KriptoNiteTests
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation
@testable import KriptoNite

class ViewModelMock {
    var dataFetched: Bool = false
}

extension ViewModelMock: CriptosViewModelProtocol {
    var data: MasterDataModel? {
        return nil
    }
    
    func fetchData() {
        dataFetched = true
    }
}
