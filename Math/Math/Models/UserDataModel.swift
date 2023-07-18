//
//  UserDataModel.swift
//  Math
//
//  Created by Romington Hydro on 17/07/23.
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
