//
//  User.swift
//  Math
//
//  Created by Andrew Oroh on 09/07/23.
//

import Foundation

struct User : Hashable, Codable, Identifiable{
    var name: String
    var id: Int
    var life: Int
    var currency : Int
    var streak: Int
    var currentLevel: Int
}
