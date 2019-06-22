//
//  GameAreaPresenter.swift
//  MultiEduca
//
//  Created by Sandra on 27/10/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation

enum GameState {
    case renderData(_ data: String) // Replace String by view model
    case error(messageError: String)
    case loading
}

final class GameAreaPresenter {
    
    fileprivate let view: GameAreaViewContract
    fileprivate let router: GameAreaRouterContract
    fileprivate let interactor: GameAreaInteractorContract
    fileprivate var currentState: GameState {
        didSet {
            view.renderState(currentState)
        }
    }
    
    init(view: GameAreaViewContract, router: GameAreaRouterContract, interactor: GameAreaInteractorContract) {
        self.view = view
        self.router = router
        self.interactor = interactor
        currentState = .loading
    }
    
    // MARK: Private functions
    fileprivate func setState(_ state: GameState) {
        currentState = state
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
            //render data state
        } else {
            setState(.error(messageError: "level_no_content_error_message".localized))
        }
    }
    
    //Esto puede que sobre...
    func getTotalQuestions(gameId: String, levelId: String) -> Int {
        return interactor.getQuestionsLevelTotalNumber(gameId: gameId, levelId: levelId)
    }
    
    func backToLevelScreen() {
        router.backToLevels()
    }
}
