//
//  tutorial-1.swift
//  Math
//
//  Created by Ellen Chandra on 07/07/23.
//

import SwiftUI

struct MainView: View {
    @State private var isZoomed = false
    @State private var navigateToNextScreen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    tutorial_Intro(isZoomed: $isZoomed, navigateToNextScreen: $navigateToNextScreen)
                }
                
                if navigateToNextScreen {
                    TutorialPenguinTalking()
                        .navigationBarHidden(true)
                }
            }
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 5.0).delay(2.0)) {
                    isZoomed = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                    navigateToNextScreen = true
                }
            }
        }
    }
}

struct tutorial_Intro: View {
    @Binding var isZoomed: Bool
    @Binding var navigateToNextScreen: Bool
    
    var body: some View {
        ZStack {
            Image("BackgroundTutorial")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .scaleEffect(isZoomed ? 1.5 : 1.0)
                .animation(Animation.easeInOut(duration: 5.0))
                .offset(x: isZoomed ? 100 : 0, y: isZoomed ? -100 : 0)
                .onTapGesture {
                    withAnimation {
                        isZoomed.toggle()
                    }
                }
            
            Image("PenguinChef")
                .resizable()
                .scaledToFit()
                .scaleEffect(isZoomed ? 0.3 : 0.15)
                .animation(Animation.easeInOut(duration: 5.0))
                .offset(x: isZoomed ? -50 : -130, y: isZoomed ? 190 : 150)
        }
    }
}

struct TutorialPenguinTalking: View {
    var body: some View {
        
        ZStack{
            Image("BubbleDialogue")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(0.4)
                .offset(x: 30, y: 100)
            
            Text("Hi there!")
                .offset(x: 33, y: 95)
                .fontWeight(.medium)
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
