//
//  PizzaController.swift
//  Gamificaiton
//
//  Created by Andrew Oroh on 16/07/23.
//

import SpriteKit

class PizzaController {
    private var scene: SKScene
    private var pizzaNodes: [SKSpriteNode] = []
    private var pizzaModels : [PizzaModel] = []
    private var pizzaInitialPositions: [CGPoint] = []

    init(scene: SKScene) {
        self.scene = scene
    }
    
    func addPizza(model: PizzaModel) {
        let pizzaNode = SKSpriteNode(texture: model.texture)
        pizzaNode.name = model.name
        pizzaNode.position = model.position
        pizzaNode.setScale(model.scale)
        
        pizzaModels.append(model)
        pizzaNodes.append(pizzaNode)
        pizzaInitialPositions.append(model.position)
        scene.addChild(pizzaNode)
    }
    
    
    
    var allPizzaModels: [PizzaModel]{
        get{
            return pizzaModels
        }
        set{
            pizzaModels = newValue
        }
    }
    
    var allPizzaNodes: [SKSpriteNode] {
        get {
            return pizzaNodes // Getter for the pizzaNodes array
        }
        set {
            pizzaNodes = newValue // Setter for the pizzaNodes array
        }
        
    }
    
    var allPizzaInitialPositions: [CGPoint] {
        get {
            return pizzaInitialPositions // Getter for the pizzaInitialPosition array
        }
        set {
            pizzaInitialPositions = newValue // Setter for the pizzaInitialPosition array
        }
    }
}

