//
//  Level.swift
//  Math
//
//  Created by Andrew Oroh on 09/07/23.
//

import Foundation

struct Level: Hashable, Codable, Identifiable{
    var id: Int
    var levelNumber : Int
    var levelCategory : String
    var title: String
    var description : String
    var currencyReward : Int
}
