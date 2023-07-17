//
//  GameView.swift
//  Math
//
//  Created by Romington Hydro on 17/07/23.
//

import Foundation
import SwiftUI
import SpriteKit
import GameplayKit

struct GameView: UIViewRepresentable {
    func makeUIView(context: Context) -> SKView {
        let skView = SKView()
        return skView
    
    
    }

    func updateUIView(_ uiView: SKView, context: Context) {
        if let scene = GameScene(fileNamed: "GameScene") {
//            scene.scaleMode = .resizeFill
            uiView.presentScene(scene)
        }
    }
}
typealias UIViewType = SKView

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Text("Your SwiftUI content here")
//            GameView()
//                .frame(width: 300, height: 300)
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}



