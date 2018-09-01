//
//  GameAreaView.swift
//  MultiEduca
//
//  Created by Sandra on 1/9/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import UIKit

class GameAreaView: UIViewController {
    
    fileprivate var gameId:String?
    fileprivate var levelId:String?
    fileprivate var barTitle:String?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.yellow
        print(gameId ?? "Nada")
        print(levelId ?? "Nada")
    }
    
    func setGameId(_ gameId:String, andLevelId:String, title:String)
    {
        self.gameId = gameId
        self.levelId = andLevelId
        self.barTitle = title
    }
    
}


extension GameAreaView: GameAreaContract {
    
    func showAlert(title: String?, message: String?)
    {
        
    }
}
