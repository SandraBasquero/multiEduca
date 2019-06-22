//
//  GameAreaView.swift
//  MultiEduca
//
//  Created by Sandra on 1/9/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import UIKit

class GameAreaView: BaseViewController<GameAreaPresenter> {
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    fileprivate var gameId:String?
    fileprivate var levelId:String?
    fileprivate var barTitle:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.start()
    }
    
    func setGameId(_ gameId:String, andLevelId:String, title:String) {
        self.gameId = gameId
        self.levelId = andLevelId
        self.barTitle = title
    }
    
    override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {}
    
    // MARK: States private implementation
    fileprivate func renderErrorState(message: String) {
        self.showSimpleAlert(title: title, message: message, buttonText: "home_error_button".localized) { _ in
            self.presenter.backToLevelScreen()
        }
    }
}

// MARK: - GameAreaViewContract
extension GameAreaView: GameAreaViewContract {
    
    func setupViews() {
        showHomeButtonOnNavigationBar(true)
        if let game = gameId, let level = levelId {
            pageControl.numberOfPages = presenter.getTotalQuestions(gameId: game, levelId: level)
            pageControl.currentPage = 0
            presenter.getContent(gameId: game, levelId: level)
        }
    }
    
    //Required by ViewContractBase protocol, but not used because of the states implementation
    func showAlert(title: String?, message: String?) {}
    
    func renderState(_ currentState: GameState) {
        switch currentState {
        case .renderData(let data):
            print(data)
        case .error(let message):
            renderErrorState(message: message)
        case .loading:
            print("Loading...")
        }
    }
}

// MARK: - BaseViewControllerDelegate
extension GameAreaView: BaseViewControllerDelegate {
    
    func homeButtonPressed() {
        presenter.backToHomeMenu()
    }
}
