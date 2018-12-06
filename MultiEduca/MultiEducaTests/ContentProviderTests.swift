//
//  ContentProviderTests.swift
//  MultiEducaTests
//
//  Created by Sandra on 18/11/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import XCTest
@testable import MultiEduca

class ContentProviderTests: XCTestCase {

    func testGetContent() {
        let cache: GameContentCacheContract = DummyCache()
        let provider: ContentLevelProviderContract = ContentLevelProvider(cache: cache)
        
        provider.getContentLevel(gameId: "1", leveId: "l2") { contentEither in
            var errorContent: NSError
            var content = [Content]()
            switch contentEither {
            case .error:
                errorContent = NSError()
            case .data(let data):
                content = data
            }
            XCTAssertEqual(content.count, 3)
            XCTAssertEqual(content[0].answer,  "DummyAnswer1")
            XCTAssertEqual(content[1].description,  "DummyDescription2")
            XCTAssertEqual(content[2].points, 4)
        }
    }
}


class DummyCache:GameContentCacheContract {
    
    var gameContentTest:GameContentModel = GameContentModel()
    let dummyContent = [Content(description: "DummyDescription1", answer: "DummyAnswer1", points: 3),
                        Content(description: "DummyDescription2", answer: "DummyAnswer2", points: 3),
                        Content(description: "DummyDescription3", answer: "DummyAnswer3", points: 4)]
    init() {
        gameContentTest.append(GameContentModelElement(id: "1", levels: [Level(id: "l1", contents: dummyContent),
                                                                         Level(id: "l2", contents: dummyContent)]))
        gameContentTest.append(GameContentModelElement(id: "2", levels: [Level(id: "l4", contents: dummyContent),
                                                                         Level(id: "l5", contents: dummyContent),
                                                                         Level(id: "l6", contents: dummyContent)]))
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
