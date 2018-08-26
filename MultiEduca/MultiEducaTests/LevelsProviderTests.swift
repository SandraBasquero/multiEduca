//
//  LevelsProviderTests.swift
//  MultiEducaTests
//
//  Created by Sandra on 19/8/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import XCTest
@testable import MultiEduca

class LevelsProviderTests: XCTestCase {

    func testGetLevelsOfGame() {
        
        let cache:GameContentCacheContract = TestCache()
        let fileManager:FilesManagerContract = FilesManager()
        let provider:LevelsDataProviderContract = LevelsDataProvider(fileManager: fileManager, cache: cache)
        
        provider.getLevelsOfGame(id: "1") { (levels, error) in
            XCTAssertEqual(levels, [1,2])
        }
        
        provider.getLevelsOfGame(id: "2") { (levels, error) in
            XCTAssertEqual(levels, [4,5,6])
        }
        
        provider.getLevelsOfGame(id: "3") { (levels, error) in
            XCTAssertEqual(levels, [20,21])
        }
    
        provider.getLevelsOfGame(id: "") { (levels, error) in
            XCTAssertNil(levels)
            // TODO: check this 
            //XCTAssertNotNil(error)
        }
    }
}


class TestCache:GameContentCacheContract {
    
    var gameContentTest:GameContentModel = GameContentModel()
    
    init() {
        gameContentTest.append(GameContentModelElement(id: "1", levels: [Level(id: "l1", contents: nil),
                                                                         Level(id: "l2", contents: nil)]))
        gameContentTest.append(GameContentModelElement(id: "2", levels: [Level(id: "l4", contents: nil),
                                                                         Level(id: "l5", contents: nil),
                                                                         Level(id: "l6", contents: nil)]))
        gameContentTest.append(GameContentModelElement(id: "3", levels: [Level(id: "l20", contents: nil),
                                                                        Level(id: "l21", contents: nil)]))
    }
    
    var testContent:GameContentModel?
    
    func saveData(_ data: GameContentModel) {
        testContent = data
    }
    
    func getAllData() -> GameContentModel? {
        return gameContentTest
    }
}
