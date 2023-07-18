//
//  ObjectNode3.swift
//  Math
//
//  Created by Romington Hydro on 17/07/23.
//

import Foundation
import SpriteKit

class ObjectNode{
    var name: String
    var texture: SKTexture
    var position: CGPoint
    var scale: CGFloat
    
    init(name: String, texture: SKTexture, position: CGPoint, scale: CGFloat) {
        self.name = name
        self.texture = texture
        self.position = position
        self.scale = scale
    }
}

