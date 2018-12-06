//
//  ContentLevelProviderContract.swift
//  MultiEduca
//
//  Created by Sandra on 4/11/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation

protocol ContentLevelProviderContract {
    func getContentLevel(gameId: String, leveId: String, completion: @escaping(ContentLevelEither) -> Void)
}
