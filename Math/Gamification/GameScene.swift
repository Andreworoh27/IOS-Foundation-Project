//
//  GameScene.swift
//  Gamificaiton
//
//  Created by Andrew Oroh on 14/07/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    private var initialTouchPosition: CGPoint?
    private var pizzaArraySize : Int = 0
    private var currentlyTapPizza : String = ""
    private var pizzaController: PizzaController!
    private var customerController: CustomerController!
    private var buttonController: ButtonController!
    private var dragItemController:DragItemController!
    var progressValue: Double = 0
    private var progressBar: SKShapeNode!


    override func didMove(to view: SKView) {
        // Create the progress bar
        let progressBarWidth: CGFloat = 200
        let progressBarHeight: CGFloat = 20
        let progressBarRect = CGRect(x: -progressBarWidth/2, y: size.height - progressBarHeight - 10, width: progressBarWidth, height: progressBarHeight)
        progressBar = SKShapeNode(rect: progressBarRect, cornerRadius: progressBarHeight/2)
        progressBar.fillColor = SKColor.green
        progressBar.strokeColor = SKColor.clear
        addChild(progressBar)
        
        print(#function)
        // Enable user interaction for the scene
        self.isUserInteractionEnabled = true
        pizzaController = PizzaController(scene: self)
        pizzaController.allPizzaInitialPositions.append(CGPoint(x: 10.5, y: -241.90000915527344))
        customerController = CustomerController(scene: self)
        buttonController = ButtonController()
        dragItemController = DragItemController()
        
        // Create a new pizza model
        let pizzaModel = PizzaModel(name: "Full Pizza",
                                    texture: SKTexture(imageNamed: "FullPizza"),
                                    position: pizzaController.allPizzaInitialPositions[0],
                                    scale: 0.45,pizzaFraction: 1.0)
        
        // Add the pizza model to the controller
        pizzaController.addPizza(model: pizzaModel)
        
        // Create a new customer model
        let customerModel1 = CustomerModel(name: "dropZone1",
                                           texture: SKTexture(imageNamed: "Customer 1"),
                                           position: CGPoint(x: -80, y: 185),
                                           scale: 1.5,fractionRequirement: 0.5)
        
        // Add the customer model to the controller
        customerController.addCustomer(model: customerModel1)
        
        // Create another customer model
        let customerModel2 = CustomerModel(name: "dropZone2",
                                           texture: SKTexture(imageNamed: "Customer 2"),
                                           position: CGPoint(x: 90, y: 175),
                                           scale: 1.4,fractionRequirement: 0.5)
        
        // Add the customer model to the controller
        customerController.addCustomer(model: customerModel2)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Check if any touch event occurred
        guard let touch = touches.first else { return }
        
        // Get the location of the touch
        let location = touch.location(in: self)
        
        // Check if the HalfButton node was clicked
        if let halfButton = self.childNode(withName: "HalfButton") as? SKSpriteNode,
           halfButton.contains(location) {
            
            buttonController.HalfButtonClicked(pizzaController: pizzaController)

        }
        // Check if any pizza node was tapped
        for pizzaNode in pizzaController.allPizzaNodes {
            if pizzaNode.contains(location) {
                // Store the initial touch position of the pizza node in its parent's coordinate system
                currentlyTapPizza = pizzaNode.name!
                initialTouchPosition = touch.location(in: pizzaNode.parent!)
                break
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Check if the initial touch position is set
        guard let initialPosition = self.initialTouchPosition else { return }
        
        // Check if any touch event occurred
        guard let touch
                = touches.first else { return }
        
        // Get the location of the touch in the parent's coordinate system
        let touchPosition = touch.location(in: self)
        
        // Calculate the difference between the current and initial touch positions
        let dx = touchPosition.x - initialPosition.x
        let dy = touchPosition.y - initialPosition.y
//        print(String(describing: dx))
        // Move each pizza node by the difference
        for pizzaNode in pizzaController.allPizzaNodes {
            if(pizzaNode.name == currentlyTapPizza){
                dragItemController.dragItem(pizzaController: pizzaController, customerController: customerController, dx: dx, dy: dy,pizzaNode: pizzaNode,scene: self)
            }
        }
        
        // Update the initial touch position for the next move event
        initialTouchPosition = touchPosition
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Check if any touch event occurred
        guard let touch = touches.first else { return }
        
        // Get the location of the touch
        let location = touch.location(in: self)
        
        // Check if any pizza node was tapped
        for pizzaNode in pizzaController.allPizzaNodes {
            if pizzaNode.contains(location) {
                dragItemController.checkPizzaDropZone(scene: self, pizzaController: pizzaController,customerController: customerController ,pizzaNode: pizzaNode,progressValue:  &progressValue)
                print(progressValue)
                break
            }
        }
        
        
        
        // Reset the initial touch position
        initialTouchPosition = nil
        currentlyTapPizza = ""
        updateProgressBar()
    }
    
    private func updateProgressBar() {
        let stageWidth = progressBar.frame.width / 3
        let currentStage = Int(progressValue * 3) // Assuming progressValue ranges from 0 to 1
        
        // Calculate the width of the progress bar based on the current stage
        let progressWidth = stageWidth * CGFloat(currentStage)
        progressBar.xScale = progressWidth / progressBar.frame.width
    }
}

extension CGPoint {
    func distance(to point: CGPoint) -> CGFloat {
        let dx = point.x - self.x
        let dy = point.y - self.y
        return sqrt(dx*dx + dy*dy)
    }
}
