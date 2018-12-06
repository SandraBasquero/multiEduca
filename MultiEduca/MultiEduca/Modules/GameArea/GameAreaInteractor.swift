//
//  GameAreaInteractor.swift
//  MultiEduca
//
//  Created by Sandra on 27/10/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation

final class GameAreaInteractor {
    
    let provider: ContentLevelProviderContract
    
    init(provider: ContentLevelProviderContract) {
        self.provider = provider
    }
}


extension GameAreaInteractor: GameAreaInteractorContract {
    
    func getContentLevel(gameId: String, levelId: String) -> [Content] {
        var levelContent = [Content]()
        provider.getContentLevel(gameId: gameId, leveId: levelId) { response in
            switch response {
            case .error:
                levelContent = []
            case .data(let content):
                levelContent = content
            }
        }
        return levelContent
    }
}
