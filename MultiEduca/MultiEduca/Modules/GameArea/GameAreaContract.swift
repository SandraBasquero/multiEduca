//
//  GameAreaContract.swift
//  MultiEduca
//
//  Created by Sandra on 1/9/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation


protocol GameAreaViewContract:ViewContractBase {
    func setupViews()
    func renderState(_ currentState: GameState)
}

protocol GameAreaPresenterContract: PresenterContractBase {
    func backToHomeMenu()
    func getNewContentShuffled(gameId: String, levelId: String)
    func getTotalQuestions(gameId: String, levelId: String) -> Int
    func updateCurrentPlayingGame()
    func backToLevelScreen()
    func answerValidator(gameCells: [OneTextGameCellViewModel])
}

protocol GameAreaInteractorContract {
    func getContentLevel(gameId: String, levelId: String) -> [Content]
    func getQuestionsLevelTotalNumber(gameId: String, levelId: String) -> Int
}

protocol GameAreaRouterContract {
    func backToHomeMenu()
    func backToLevels()
}
