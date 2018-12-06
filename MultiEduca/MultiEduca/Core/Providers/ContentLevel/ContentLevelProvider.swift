//
//  ContentLevelProvider.swift
//  MultiEduca
//
//  Created by Sandra on 18/11/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation

enum ContentLevelEither {
    case error
    case data([Content])
}

final class ContentLevelProvider {
    var cache:GameContentCacheContract
    
    init(cache:GameContentCacheContract)
    {
        self.cache = cache
    }
}

extension ContentLevelProvider: ContentLevelProviderContract {
    
    func getContentLevel(gameId: String, leveId: String, completion: @escaping (ContentLevelEither) -> Void) {
        if let gameData = cache.getAllData() {
            if let game = gameData.first(where: { $0.id == gameId }),
                let levelGame = game.levels?.first(where: { $0.id == leveId }) {
                completion(ContentLevelEither.data(levelGame.contents!))
            }
        } else {
            completion(ContentLevelEither.error)
        }
    }
}
