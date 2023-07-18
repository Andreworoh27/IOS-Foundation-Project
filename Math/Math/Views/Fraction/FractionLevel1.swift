//
//  FractionLevel1.swift
//  Math
//
//  Created by Andrew Oroh on 09/07/23.
//

import SwiftUI
import SpriteKit

class ProgressValue: ObservableObject {
    @Published var progress: Double = 0.0
}


struct FractionLevel1 : View{
    @EnvironmentObject var staticData : StaticData
    @ObservedObject var progressValue : ProgressValue = ProgressValue()
    @State private var levelClear = false

        
    var scene : SKScene{
        let scene : GameScene = SKScene(fileNamed: "GameScene") as! GameScene
        scene.progressValue = progressValue
        scene.size = CGSize(width: 414, height:896)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View{
        ZStack{
            SpriteView(scene: scene)
                .frame(width: 414, height:896)
                .ignoresSafeArea()
            VStack{
                InGameStatusBar(progress: progressValue.progress, checkpoints: [0.5,0.97])
                    .environmentObject(staticData)
                Spacer()
            }
            NavigationLink(destination: LevelClearPage(), isActive: $levelClear) {
                EmptyView()
            }
            .hidden()

        }
        .navigationBarBackButtonHidden(true)
        .onAppear{
            progressValue.progress = 0.0
        }
        .onChange(of: progressValue.progress) { newValue in
            if newValue == 1.0{
                levelClear = true
            }
        }
    }
}

struct FractionLevel1_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var staticData: StaticData = StaticData()
        FractionLevel1()
            .environmentObject(staticData)
    }
}

