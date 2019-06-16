//
//  GameAreaView.swift
//  MultiEduca
//
//  Created by Sandra on 1/9/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import UIKit

class GameAreaView: BasePageViewController<GameAreaPresenter> {
    
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
}

// MARK: - GameAreaViewContract
extension GameAreaView: GameAreaViewContract {
    
    func setupViews() {
        print(gameId ?? "Nada")
        print(levelId ?? "Nada")
        showHomeButtonOnNavigationBar(true)
        delegate = self
        dataSource = self
        
        // Por aquí...
        if let game = gameId, let level = levelId {
            presenter.getContent(gameId: game, levelId: level)
        }
    }

    func showAlert(title: String?, message: String?) {
        
    }
}

// MARK: - BaseViewControllerDelegate
extension GameAreaView: BaseViewControllerDelegate {
    
    func homeButtonPressed() {
        presenter.backToHomeMenu()
    }
}

// MARK: - UIPageViewController Delegate and Data source
extension GameAreaView: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return self
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return self
    }
}
