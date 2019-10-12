//
//  GameAreaPresenter.swift
//  MultiEduca
//
//  Created by Sandra on 27/10/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation

enum GameState {
    case renderData(_ data: GameAreaViewModel)
    case error(messageError: String)
    case loading
    case correctAnswer
}

final class GameAreaPresenter {
    
    fileprivate let view: GameAreaViewContract
    fileprivate let router: GameAreaRouterContract
    fileprivate let interactor: GameAreaInteractorContract
    fileprivate var currentPlayingGame = 0
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
    
    // MARK: - Private functions
    fileprivate func setState(_ state: GameState) {
        currentState = state
    }
    
    fileprivate func wordsValidator(answer: [OneTextGameCellViewModel]) -> Bool {
        let sortedGame = answer.sorted { $0.index < $1.index }
        return  answer == sortedGame
    }
    
    fileprivate func numbersValidator(answer: [OneTextGameCellViewModel]) -> Bool {
        //TODO: Think now about a brilliant way to validate numbers...
        return true
    }
}

    // MARK: - GameAreaPresenterContract
extension GameAreaPresenter: GameAreaPresenterContract {

    func start() {
        view.setupViews()
    }
    
    func backToHomeMenu() {
        router.backToHomeMenu()
    }
    
    func getNewContentShuffled(gameId: String, levelId: String) {
        let content = interactor.getContentLevel(gameId: gameId, levelId: levelId)
        if content.count > 0  {
            if currentPlayingGame < content.count {
                var viewModel = GameAreaViewModelsMapper.contentConverter(content: content[currentPlayingGame], currentPageGame: currentPlayingGame)
                viewModel.game.shuffle()
                setState(.renderData(viewModel))
            } else {
                // End of the current level game
            }
        } else {
            setState(.error(messageError: "level_no_content_error_message".localized))
        }
    }
    
    //Esto puede que sobre...
    func getTotalQuestions(gameId: String, levelId: String) -> Int {
        return interactor.getQuestionsLevelTotalNumber(gameId: gameId, levelId: levelId)
    }
    
    func updateCurrentPlayingGame() {
        currentPlayingGame += 1
    }
    
    func backToLevelScreen() {
        router.backToLevels()
    }
    
  func answerValidator(gameCells: [OneTextGameCellViewModel]) {
        var currentData: GameAreaViewModel? {
            switch self.currentState {
            case let .renderData(data):
                return data
            default:
                return nil
            }
        }
        var isValid = false
        print(currentData?.gameFamilyType)
        switch currentData?.gameFamilyType {
            case .words:
                isValid = wordsValidator(answer: gameCells)
            case .numbers:
                isValid = numbersValidator(answer: gameCells)
            case .none:
                isValid = false
        }
        if isValid {
            setState(.correctAnswer)
        }
    }
}
