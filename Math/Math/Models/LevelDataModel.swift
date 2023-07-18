//
//  LevelDataModel.swift
//  Math
//
//  Created by Romington Hydro on 17/07/23.
//

import Foundation

struct LevelDataModel: Identifiable{
    var id = UUID()
    var levelDisplayNumber : Int
    var levelCategory : String
    var levelCount : Int // for marker to each level
    var levelTitle: String
    var levelDescription : String
    var currencyReward : Int
}

