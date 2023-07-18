//
//  PizzaModel3.swift
//  Math
//
//  Created by Romington Hydro on 17/07/23.
//

import SpriteKit
import Foundation

class PizzaModel: ObjectNode {
    var pizzaFraction : Double
    
    init(name: String, texture: SKTexture, position: CGPoint, scale: CGFloat, pizzaFraction : Double) {
        self.pizzaFraction = pizzaFraction
        super.init(name: name, texture: texture, position: position, scale: scale)
    }
}

