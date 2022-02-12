//
//  WalletsTests.swift
//  KriptoNiteTests
//
//  Created by Erik Nascimento on 12/02/2022.
//

import XCTest
@testable import KriptoNite

class WalletsTests: XCTestCase {

    var data: Data?
    var sut: WalletsDataViewModel!
        
    override func setUpWithError() throws {
        data = FileLoader.loadData()
        sut = WalletsDataViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadMasterData() throws {
        XCTAssertNotNil(data)
    }
    
    func testLoadMasterDataFromLocalFile() throws {
        sut.fetchData(filter: nil)
        XCTAssertNotNil(sut.walletData)
    }
    
    func testLoadMasterDataFromLocaFileToModel() throws {
        sut.fetchData(filter: nil)
        XCTAssertNotNil(sut.walletData)
    }

    func testViewModelMasterDataAttributes() throws {
        sut.fetchData(filter: nil)
        XCTAssertNotNil(sut.walletData)
        let data = sut.walletData
        XCTAssertNotNil(data?[0].attributes)
    }

    func testViewModelMasterDataWallets() throws {
        sut.fetchData(filter: nil)
        XCTAssertNotNil(sut.commodityWalletData)
        XCTAssertNotNil(sut.walletData)
        XCTAssertNotNil(sut.fiatWalletData)
    }
}
