//
//  GameContentModel.swift
//  MultiEduca
//
//  Created by Sandra on 15/8/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation

typealias GameContentModel = [GameContentModelElement]

struct GameContentModelElement: Codable {
    let id: String?
    let levels: [Level]?
}

struct Level: Codable {
    let id: String?
    let contents: [Content]?
}

struct Content: Codable {
    let description, answer: String?
    let points: Int?
}
