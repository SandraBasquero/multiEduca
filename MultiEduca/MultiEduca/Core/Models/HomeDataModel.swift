//
//  HomeDataModel.swift
//  MultiEduca
//
//  Created by Sandra on 27/7/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation
import ObjectMapper

class HomeDataModel: NSObject, Mappable, NSCoding {
    
    var id:String?
    var name:String?
    var imageBase64:String?
    
    //-------------------
    // MARK: ObjectMapper
    //-------------------

    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        imageBase64 <- map["image"]
    }
    
    //---------------
    // MARK: NSCoding
    //---------------
    init(id:String, name:String, image:String) {
        self.id = id
        self.name = name
        self.imageBase64 = image
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeObject(forKey: "id") as! String
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let image = aDecoder.decodeObject(forKey: "imageBase64") as! String
        self.init(id: id, name: name, image: image)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(imageBase64, forKey: "imageBase64")
    }
}
