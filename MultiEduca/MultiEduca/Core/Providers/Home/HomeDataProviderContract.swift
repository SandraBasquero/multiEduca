//
//  ProviderContract.swift
//  MultiEduca
//
//  Created by Sandra on 31/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation


protocol HomeDataProviderContract {
    
    func getHomeData(completion:@escaping([HomeDataModel]?, NSError?)->Void)
    
}
