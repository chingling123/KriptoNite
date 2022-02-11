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
    var data: [CriptoModel]? {
        return nil
    }
    
    func fetchData(filter: AttributesType?) {
        dataFetched = true
    }
}
