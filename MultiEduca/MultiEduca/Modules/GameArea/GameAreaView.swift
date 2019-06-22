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
}

// MARK: - GameAreaViewContract
extension GameAreaView: GameAreaViewContract {
    
    func setupViews() {
        print(gameId ?? "Nada")
        print(levelId ?? "Nada")
        showHomeButtonOnNavigationBar(true)
        if let game = gameId, let level = levelId {
            pageControl.numberOfPages = presenter.getTotalQuestions(gameId: game, levelId: level)
            pageControl.currentPage = 0
            presenter.getContent(gameId: game, levelId: level)
        }
    }
    
    func showAlert(title: String?, message: String?) {
        self.showSimpleAlert(title: title, message: message, buttonText: "home_error_button".localized) { _ in
            self.presenter.backToLevelScreen()
        }
    }
}

// MARK: - BaseViewControllerDelegate
extension GameAreaView: BaseViewControllerDelegate {
    
    func homeButtonPressed() {
        presenter.backToHomeMenu()
    }
}
