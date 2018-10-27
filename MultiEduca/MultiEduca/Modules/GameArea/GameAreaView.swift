//
//  GameAreaView.swift
//  MultiEduca
//
//  Created by Sandra on 1/9/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import UIKit

class GameAreaView: BaseViewController<GameAreaPresenter> {
    
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


extension GameAreaView: GameAreaViewContract {
    
    func setupViews() {
        self.view.backgroundColor = UIColor.yellow
        print(gameId ?? "Nada")
        print(levelId ?? "Nada")
        
        let btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "testImage"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        //btn1.addTarget(self, action: #selector(Class.Methodname), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        navigationItem.setRightBarButtonItems([item1], animated: true)
    }
    
    
    func showAlert(title: String?, message: String?) {
        
    }
}
