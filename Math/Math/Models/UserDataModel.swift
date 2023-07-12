//
//  User.swift
//  Math
//
//  Created by Andrew Oroh on 09/07/23.
//

import Foundation

struct UserDataModel :Identifiable{
    var name: String
    var id = UUID()
    var life: Int
    var currency : Int
    var streak: Int
    var currentLevelCount: Int
}
