//
//  HomeDataModel.swift
//  MultiEduca
//
//  Created by Sandra on 27/7/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation
import ObjectMapper

struct HomeDataModel: Mappable {
    var id:String?
    var name:String?
    var imageBase64:String?
    
    init?(map: Map) {
    
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        imageBase64 <- map["image"]
    }
}





