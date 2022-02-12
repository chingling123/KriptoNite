//
//  CriptosViewControllerTests.swift
//  KriptoNiteTests
//
//  Created by Erik Nascimento on 10/02/2022.
//

import XCTest
@testable import KriptoNite

class CriptosViewControllerTests: XCTestCase {
    var sut: CriptosViewController!
    var vm: CriptosDataViewModel!
    
    override func setUpWithError() throws {
        vm = CriptosDataViewModel()
        sut = CriptosViewController(vm: vm)
    }

    override func tearDownWithError() throws {
        
    }

    func testViewWillAppearDataFetched() throws {
        sut.viewWillAppear(true)
        XCTAssertNotNil(vm.criptoData)
    }
    
    func testFilterData() throws {
        sut.viewDidLoad()
        sut.viewWillAppear(true)
        guard let hasData = vm.criptoData else {
            XCTFail("Data shouldn't be empty")
            return
        }
        
        let fiatCounter = hasData.filter { $0.type == .fiat }.count
        vm.fetchData(filter: .fiat)
        let filterCounter = vm.criptoData?.map { $0.type == .fiat }.count
        
        XCTAssertTrue(fiatCounter == filterCounter)
    }
    
}
