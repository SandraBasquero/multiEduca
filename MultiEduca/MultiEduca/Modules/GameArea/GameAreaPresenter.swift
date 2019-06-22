//
//  GameAreaPresenter.swift
//  MultiEduca
//
//  Created by Sandra on 27/10/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation

final class GameAreaPresenter {
    
    let view: GameAreaViewContract
    let router: GameAreaRouterContract
    let interactor: GameAreaInteractorContract
    
    init(view: GameAreaViewContract, router: GameAreaRouterContract, interactor: GameAreaInteractorContract) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}


extension GameAreaPresenter: GameAreaPresenterContract {

    func start() {
        view.setupViews()
    }
    
    func backToHomeMenu() {
        router.backToHomeMenu()
    }
    
    func getContent(gameId: String, levelId: String) {
        let content = interactor.getContentLevel(gameId: gameId, levelId: levelId)
        if content.count > 0 {
            print(content)
        } else {
            print("Nothing")
        }
    }
    
    func getTotalQuestions(gameId: String, levelId: String) -> Int {
        let totalQuestion = interactor.getQuestionsLevelTotalNumber(gameId: gameId, levelId: levelId)
        if totalQuestion == 0 {
            view.showAlert(title: "", message: "level_no_content_error_message".localized)
        }
        return totalQuestion
    }
    
    func backToLevelScreen() {
        router.backToLevels()
    }
}
