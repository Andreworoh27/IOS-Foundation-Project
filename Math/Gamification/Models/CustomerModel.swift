//
//  CustomerModel.swift
//  Math
//
//  Created by Romington Hydro on 17/07/23.
//

import Foundation
import SpriteKit

class CustomerModel: ObjectNode {
    var fractionRequierment : Double
    
    init(name: String, texture: SKTexture, position: CGPoint, scale: CGFloat,fractionRequirement: Double) {
        self.fractionRequierment = fractionRequirement
        super.init(name: name, texture: texture, position: position, scale: scale)
    }
}


