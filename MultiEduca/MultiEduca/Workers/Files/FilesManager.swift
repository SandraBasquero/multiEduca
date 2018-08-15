//
//  FilesManager.swift
//  MultiEduca
//
//  Created by Sandra on 31/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import Foundation
import ObjectMapper

class FilesManager: FilesManagerContract {

   func readHomeDataFile() -> [HomeDataModel]
    {
        var result:[HomeDataModel] = []
        if let path = Bundle.main.path(forResource: "Home", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let response = jsonResult["result"] as? [Any] {
                    for res in response {
                        result.append(Mapper<HomeDataModel>().map(JSONObject: res)!)
                    }
                }
            } catch {
                result = []
            }
        }
        return result
    }
    
    
    func readGameContentDataFile() -> GameContentModel?
    {
        var result:GameContentModel?
        if let path = Bundle.main.path(forResource: "GameContent", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                result = try? JSONDecoder().decode(GameContentModel.self, from: data)
            } catch {
                result = nil
            }
        }
        return result
    }
}
