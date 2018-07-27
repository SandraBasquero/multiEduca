//
//  HomeInteractor.swift
//  MultiEduca
//
//  Created by Sandra on 31/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation


final class HomeInteractor {
    
    let provider:HomeDataProviderContract
    
    init(provider:HomeDataProviderContract)
    {
        self.provider = provider
    }
}


extension HomeInteractor: HomeInteractorContract {
    
    func getHomeData() -> [HomeDataModel]?
    {
        var data:[HomeDataModel]?
        provider.getHomeData { (models, error) in
            if error == nil && !(models?.isEmpty)! {
                data = models
            } else {
                data = nil
            }
        }
        return data
    }
}
