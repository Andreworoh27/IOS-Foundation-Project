//
//  TutorialIntro2.swift
//  Math
//
//  Created by Ellen Chandra on 12/07/23.
//

import SwiftUI

struct TutorialIntro2: View {
    @State private var isVisible = false
    
    var body: some View {
        
        
        ZStack {
            Image("backgroundwpenguin")
                .resizable()
                .scaledToFit()
                .scaleEffect(1.3)
                .opacity(isVisible ? 1 : 0) // Apply opacity based on isVisible state
                .animation(.easeInOut(duration: 0.5))
            
            Image("BubbleDialogue")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(0.3)
                .offset(x: 100, y: 85)
                .opacity(isVisible ? 1 : 0)
                .animation(.easeInOut(duration: 0.5).delay(0.4))
            
            Text("Come inside!")
                .font(.system(size: 13))
                .offset(x: 102, y: 80)
                .fontWeight(.medium)
                .opacity(isVisible ? 1 : 0)
                .animation(.easeInOut(duration: 0.5).delay(0.4))
            
            
            
        }
        .onAppear{isVisible = true}
        
    }
    
}
    
struct TutorialIntro2_Previews: PreviewProvider {
    static var previews: some View {
        TutorialIntro2()
    }
}
