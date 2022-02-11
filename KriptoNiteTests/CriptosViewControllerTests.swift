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
    var vm: MasterDataViewModel!
    
    override func setUpWithError() throws {
        vm = MasterDataViewModel()
        sut = CriptosViewController(vm: vm)
    }

    override func tearDownWithError() throws {
        
    }

    func testViewWillAppearDataFetched() throws {
        sut.viewWillAppear(true)
        XCTAssertNotNil(vm.data)
    }
    
    func testFilterData() throws {
        sut.viewDidLoad()
        sut.viewWillAppear(true)
        guard let hasData = vm.data else {
            XCTFail("Data shouldn't be empty")
            return
        }
        
        let fiatCounter = hasData.filter { $0.type == .fiat }.count
        vm.fetchData(filter: .fiat)
        let filterCounter = vm.data?.map { $0.type == .fiat }.count
        
        XCTAssertTrue(fiatCounter == filterCounter)
    }
    
}
