//
//  GameAreaView.swift
//  MultiEduca
//
//  Created by Sandra on 1/9/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import UIKit

class GameAreaView: BaseViewController<GameAreaPresenter>, BaseViewControllerDelegate {
    
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
    
    func homeButtonPressed() {
        presenter.backToHomeMenu()
    }
}


extension GameAreaView: GameAreaViewContract {
    
    func setupViews() {
        self.view.backgroundColor = UIColor.yellow
        print(gameId ?? "Nada")
        print(levelId ?? "Nada")
        showHomeButtonOnNavigationBar(true)
        delegate = self
        
        // Por aquí...
        if let game = gameId, let level = levelId {
            presenter.getContent(gameId: game, levelId: level)
        }
    }

    
    func showAlert(title: String?, message: String?) {
        
    }
}
