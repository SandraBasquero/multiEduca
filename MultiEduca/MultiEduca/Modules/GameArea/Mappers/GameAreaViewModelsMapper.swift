//
//  GameAreaViewModelsMapper.swift
//  MultiEduca
//
//  Created by Sandra on 14/07/2019.
//  Copyright © 2019 Sandra. All rights reserved.
//

import Foundation

final class GameAreaViewModelsMapper {
    
    static func answerToOneTextGameCellViewModel(_ text: String) -> [OneTextGameCellViewModel] {
        let characters = text.components(separatedBy: " ")
        var cells = [OneTextGameCellViewModel]()
        characters.forEach {
            cells.append(OneTextGameCellViewModel(title: String($0), index: 1))
        }
        return cells
    }
    
}
