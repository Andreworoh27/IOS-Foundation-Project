import SpriteKit

class CustomerController {
    private var scene: SKScene
    private var customerNodes: [SKSpriteNode] = []
    private var customerModels: [CustomerModel] = []

    init(scene: SKScene) {
        self.scene = scene
    }
    
    func addCustomer(model: CustomerModel) {
        let customerNode = SKSpriteNode(texture: model.texture, size: CGSize(width: 160, height: 160))
        customerNode.setScale(model.scale)
        customerNode.position = model.position
        customerNode.name = model.name
        
        customerModels.append(model)
        customerNodes.append(customerNode)
        scene.addChild(customerNode)
    }
    
    var allCustomerModels: [CustomerModel]{
        get{
            return customerModels
        }
        set{
            customerModels = newValue
        }
    }
    
    var allCustomerNodes: [SKSpriteNode] {
        get {
            return customerNodes // Getter for the pizzaNodes array
        }
        set {
            customerNodes = newValue // Setter for the pizzaNodes array
        }
        
    }
}
