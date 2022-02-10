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
        sut.fetchData()
        XCTAssertNotNil(sut.data)
    }
    
    func testLoadMasterDataFromLocaFileToModel() throws {
        sut.fetchData()
        XCTAssertNotNil(sut.data?.mainData)
    }

    func testViewModelMasterDataAttributes() throws {
        sut.fetchData()
        XCTAssertNotNil(sut.data?.mainData.attributes)
    }
}
