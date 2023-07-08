//
//  User.swift
//  Math
//
//  Created by Andrew Oroh on 08/07/23.
//

import Foundation
import Combine

class User: ObservableObject {
    @Published var name: String = ""
    @Published var life: Int = 0
    @Published var currency: Int = 0
    @Published var currentLevel: Int = 1

    init(name: String, life: Int, currency: Int, currentLevel: Int) {
        self.name = name
        self.life = life
        self.currency = currency
        self.currentLevel = currentLevel
    }
}
