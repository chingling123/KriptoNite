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
    var vm: ViewModelMock!
    
    override func setUpWithError() throws {
        vm = ViewModelMock()
        sut = CriptosViewController(vm: vm)
    }

    override func tearDownWithError() throws {
        
    }

    func testViewWillAppearDataFetched() throws {
        sut.viewWillAppear(true)
        XCTAssertTrue(vm.dataFetched)
    }

}
