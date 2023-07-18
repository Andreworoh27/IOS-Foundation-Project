//
//  DragItemController.swift
//  Gamificaiton
//
//  Created by Andrew Oroh on 16/07/23.
//

import Foundation
import SpriteKit

class DragItemController{
    func dragItem(pizzaController : PizzaController, customerController : CustomerController,dx : Double, dy : Double, pizzaNode : SKSpriteNode, scene : SKScene){
        
        pizzaNode.position.x += dx
        pizzaNode.position.y += dy
        
        // Check if the pizza is inside the drop zone
        if let dropZone1 = scene.childNode(withName: "dropZone1") as? SKSpriteNode,
           dropZone1.contains(pizzaNode.position) {
            // Calculate the distance between the pizza and the drop zone center
            let distance = pizzaNode.position.distance(to: dropZone1.position)

            // Scale down the pizza based on the distance
            let minScale: CGFloat = 0.45
            let maxScale: CGFloat = 0.1
            let scaleFactor = minScale + (1 - distance / 200) * (maxScale - minScale)
            pizzaNode.setScale(scaleFactor)

            // Set the z-position of the pizza node to be in front of the drop zone
            pizzaNode.zPosition = dropZone1.zPosition + 1
            

        } else if let dropZone2 = scene.childNode(withName: "dropZone2") as? SKSpriteNode,
                  dropZone2.contains(pizzaNode.position) {
            // Calculate the distance between the pizza and the drop zone center
            let distance = pizzaNode.position.distance(to: dropZone2.position)

            // Scale down the pizza based on the distance
            let minScale: CGFloat = 0.45
            let maxScale: CGFloat = 0.1
            let scaleFactor = minScale + (1 - distance / 200) * (maxScale - minScale)
            pizzaNode.setScale(scaleFactor)

            // Set the z-position of the pizza node to be in front of the drop zone
            pizzaNode.zPosition = dropZone2.zPosition + 1
        } else {
            // Reset the scale of the pizza node
            pizzaNode.setScale(0.45)
            // Reset the z-position of the pizza node to its default value
            pizzaNode.zPosition = 0
        }
        
    }
    
    func checkPizzaDropZone(scene: SKScene, pizzaController : PizzaController, customerController:CustomerController, pizzaNode : SKSpriteNode,progressValue: inout Double){
        let pizzaModel = pizzaController.allPizzaModels.first(where: { $0.name == pizzaNode.name })
        
        // Check if the pizza is inside the drop zone
        if let dropZone1 = scene.childNode(withName: "dropZone1") as? SKSpriteNode,
           dropZone1.contains(pizzaNode.position) {
            print(dropZone1)
            let customerModel = customerController.allCustomerModels.first(where: { $0.name == dropZone1.name})

            if pizzaModel?.pizzaFraction == customerModel?.fractionRequierment{
                // Remove the pizza node from the scene
                pizzaNode.removeFromParent()
                dropZone1.removeFromParent()
                print("points + 500")
                progressValue += 0.5
            }
            else{
                print("Invalid Requierment")
                // Reset the position of the pizza node
                pizzaNode.position = pizzaController.allPizzaInitialPositions[ pizzaController.allPizzaNodes.firstIndex(of: pizzaNode) ?? 0]
            }
            
        } else if let dropZone2 = scene.childNode(withName: "dropZone2") as? SKSpriteNode,
                  dropZone2.contains(pizzaNode.position) {
            
            let customerModel = customerController.allCustomerModels.first(where: { $0.name == dropZone2.name})
            
            if pizzaModel?.pizzaFraction == customerModel?.fractionRequierment{
                // Remove the pizza node from the scene
                pizzaNode.removeFromParent()
                dropZone2.removeFromParent()
                print("points + 500")
                progressValue += 0.5
            }
            else{
                print("Invalid Requierment")
                // Reset the position of the pizza node
                pizzaNode.position = pizzaController.allPizzaInitialPositions[ pizzaController.allPizzaNodes.firstIndex(of: pizzaNode) ?? 0]
            }
            
        } else {
            // Reset the position of the pizza node
            pizzaNode.position = pizzaController.allPizzaInitialPositions[ pizzaController.allPizzaNodes.firstIndex(of: pizzaNode) ?? 0]
        }
    }
}
