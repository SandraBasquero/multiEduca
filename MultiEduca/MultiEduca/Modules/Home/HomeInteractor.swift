//
//  HomeInteractor.swift
//  MultiEduca
//
//  Created by Sandra on 31/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation


class HomeInteractor: HomeInteractorContract {
    
    let filesManager:FilesManagerContract
    
    init(filesManager:FilesManagerContract) {
        self.filesManager = filesManager
    }
    
    
}
