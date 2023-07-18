//
//  ButtonController.swift
//  Gamificaiton
//
//  Created by Andrew Oroh on 16/07/23.
//

import Foundation
import SpriteKit

class ButtonController{
    func HalfButtonClicked(pizzaController:PizzaController){
        
        for pizzaNode in pizzaController.allPizzaNodes {
            pizzaNode.removeFromParent()
        }
        
        pizzaController.allPizzaNodes = []
        
        pizzaController.allPizzaInitialPositions = []
        
        pizzaController.allPizzaInitialPositions.append(CGPoint(x: -49.5, y: -241.90000915527344))
        pizzaController.allPizzaInitialPositions.append(CGPoint(x: 71.49999237060547, y: -241.90000915527344))
        
        // Create left pizza model
        let leftPizza = PizzaModel(name: "Split Pizza 2",
                                   texture: SKTexture(imageNamed: "Split Pizza 2"),
                                   position: pizzaController.allPizzaInitialPositions[0],
                                   scale: 0.45,pizzaFraction: 0.5)
        pizzaController.addPizza(model: leftPizza)
        
        // Create a right model
        let rightPizza = PizzaModel(name: "Split Pizza 1",
                                    texture: SKTexture(imageNamed: "Split Pizza 1"),
                                    position: pizzaController.allPizzaInitialPositions[1],
                                    scale: 0.45,pizzaFraction: 0.5)
        pizzaController.addPizza(model: rightPizza)
    }
}
