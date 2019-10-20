//
//  GameAreaViewModelsMapper.swift
//  MultiEduca
//
//  Created by Sandra on 14/07/2019.
//  Copyright © 2019 Sandra. All rights reserved.
//

import Foundation

final class GameAreaViewModelsMapper {
    
    static func contentConverter(content: Content, currentPageGame: Int) -> GameAreaViewModel {
        return GameAreaViewModel(text: content.description ?? "",
                                 game: answerToOneTextGameCellViewModel(content.answer ?? ""),
                                 currentGamePlaying: currentPageGame,
                                 points: content.points ?? 0,
                                 gameFamilyType: getFamilyTypeGame(answer: content.answer ?? ""))
    }
    
    // MARK: - Private functions
    private static func answerToOneTextGameCellViewModel(_ text: String) -> [OneTextGameCellViewModel] {
        let characters = text.components(separatedBy: " ")
        var cells = [OneTextGameCellViewModel]()
        for i in 0...characters.count - 1 {
            cells.append(OneTextGameCellViewModel(title: characters[i].uppercased(), index: i))
        }
        return cells
    }
    
    private static func getFamilyTypeGame(answer: String) -> GameType {
        if answer.contains("=") {
            return .numbers
        } else {
            return .words
        }
    }
}
