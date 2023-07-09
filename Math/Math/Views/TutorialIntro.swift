//
//  tutorial-1.swift
//  Math
//
//  Created by Ellen Chandra on 07/07/23.
//

import SwiftUI

struct tutorial_Intro: View {
    var body: some View {
        ZStack{
            Image("BackgroundTutorial")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            Image("PenguinChef")
                .scaleEffect(0.25)
                .offset(x: -90, y: 200)
            
            
        }
    }
}

struct tutorial_Intro_Previews: PreviewProvider {
    static var previews: some View {
        tutorial_Intro()
    }
}
