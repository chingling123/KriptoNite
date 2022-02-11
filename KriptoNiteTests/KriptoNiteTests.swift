//
//  KriptoNiteTests.swift
//  KriptoNiteTests
//
//  Created by Erik Nascimento on 10/02/2022.
//

import XCTest
@testable import KriptoNite

class KriptoNiteTests: XCTestCase {
    var data: Data?
    var sut: MasterDataViewModel!
        
    override func setUpWithError() throws {
        data = FileLoader.loadData()
        sut = MasterDataViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadMasterData() throws {
        XCTAssertNotNil(data)
    }
    
    func testLoadMasterDataFromLocalFile() throws {
        sut.fetchData(filter: nil)
        XCTAssertNotNil(sut.data)
    }
    
    func testLoadMasterDataFromLocaFileToModel() throws {
        sut.fetchData(filter: nil)
        XCTAssertNotNil(sut.data)
    }

    func testViewModelMasterDataAttributes() throws {
        sut.fetchData(filter: nil)
        XCTAssertNotNil(sut.data)
        let data = sut.data
        XCTAssertNotNil(data?[0].attributes)
    }
    
    func testViewModelMasterDataFilter() throws {
        sut.fetchData(filter: .cryptocoin)
        XCTAssertNotNil(sut.data)
        var data = sut.data
        XCTAssertTrue(data?[0].type == .cryptocoin)
        
        sut.fetchData(filter: .fiat)
        XCTAssertNotNil(sut.data)
        data = sut.data
        XCTAssertTrue(data?[0].type == .fiat)
        
        sut.fetchData(filter: .commodity)
        XCTAssertNotNil(sut.data)
        data = sut.data
        XCTAssertTrue(data?[0].type == .commodity)
    }
}
