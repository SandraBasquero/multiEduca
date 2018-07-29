//
//  HomeProviderTests.swift
//  MultiEducaTests
//
//  Created by Sandra on 27/7/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import XCTest
@testable import MultiEduca

class HomeDataTests: XCTestCase {
    
    func testHomeDataProvider()
    {
        let provider:HomeDataProviderContract = HomeDataProvider()
        let interactor:HomeInteractorContract = HomeInteractor(provider: provider)
        
        var dataTest:[HomeDataModel]?
        var errorTest:NSError?
        var resultData:[HomeDataModel]?
        
        provider.getHomeData { (data, error) in
            dataTest = data
            errorTest = error
        }
        
        resultData = interactor.getHomeData()
        
        if errorTest == nil {
            XCTAssertNil(errorTest)
            XCTAssertEqual(dataTest?.count, resultData?.count)
            XCTAssertEqual(dataTest![0].id, resultData![0].id)
            XCTAssertEqual(dataTest![0].name, resultData![0].name)
            XCTAssertEqual(dataTest![0].imageBase64, resultData![0].imageBase64)
        }
        if errorTest != nil {
            XCTAssertNil(dataTest)
            XCTAssertNil(resultData)
        }
        if dataTest == nil {
            XCTAssertNil(resultData)
        }
    }
}
