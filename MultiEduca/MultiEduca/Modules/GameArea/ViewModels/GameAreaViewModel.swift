//
//  GameAreaViewModel.swift
//  MultiEduca
//
//  Created by Sandra on 14/07/2019.
//  Copyright © 2019 Sandra. All rights reserved.
//

import Foundation

struct GameAreaViewModel {
    let text: String
    let game: [OneTextGameCellViewModel]
    let currentGamePlaying: Int
    let points: Int
}
