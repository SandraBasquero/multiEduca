//
//  OneTextGameCellViewModel.swift
//  MultiEduca
//
//  Created by Sandra on 12/07/2019.
//  Copyright © 2019 Sandra. All rights reserved.
//

import Foundation

struct OneTextGameCellViewModel: Equatable {
    let title: String
    let index: Int
    
    static func == (lhs: OneTextGameCellViewModel, rhs: OneTextGameCellViewModel) -> Bool {
        return lhs.index == rhs.index
    }
}
