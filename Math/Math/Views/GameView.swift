//
//  GameView.swift
//  Math
//
//  Created by Romington Hydro on 17/07/23.
//

import SwiftUI
import SpriteKit

//struct GameView: UIViewRepresentable {
//    func makeUIView(context: Context) -> SKView {
//        let skView = SKView()
//        return skView
//
//
//    }
struct GameView: UIViewRepresentable{
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

struct GameView_Preview : PreviewProvider{
    static var previews: some View{
        GameView()
    }
}

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



