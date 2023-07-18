//
//  FractionLevel1.swift
//  Math
//
//  Created by Andrew Oroh on 09/07/23.
//

import SwiftUI
import SpriteKit

struct FractionLevel1: UIViewRepresentable {
    typealias UIViewType = SKView

    func makeUIView(context: Context) -> SKView {
        let skView = SKView()
        let scene = GameScene(size: skView.bounds.size) // Initialize your SpriteKit scene
        skView.presentScene(scene)
        return skView
    }

    
    func updateUIView(_ uiView: SKView, context: Context) {
        // Update the scene or perform any other necessary updates
    }

}

struct FractionLevel1_Previews: PreviewProvider {
    static var previews: some View {
        FractionLevel1()
    }
}
