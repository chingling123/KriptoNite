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
}
