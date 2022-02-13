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

    func testLoadMasterDataFromLocaFileToModel() throws {
        XCTAssertNotNil(sut.fetchData(by: .fiat))
    }
}
