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
    @State var triggerZoomOut: Bool = false
    
    var body: some View {
        ZStack {
            Image("BackgroundTutorial")
                .resizable()
                .scaledToFit()
                .scaleEffect(isZoomed ? 1.5 : 1.3)
                .animation(Animation.easeInOut(duration: 5.0))
                .offset(x: isZoomed ? 70 : 0, y: isZoomed ? -150 : -35)
//                .onTapGesture {
//                    withAnimation {
//                        isZoomed.toggle()
//                    }
//                }
            
            Image("PenguinChef")
                .resizable()
                .scaledToFit()
                .scaleEffect(isZoomed ? 0.3 : 0.18)
                .animation(Animation.easeInOut(duration: 4.7))
                .offset(x: isZoomed ? -60 : -150, y: isZoomed ? 140 : 200)
        }
    }
}

struct TutorialPenguinTalking: View {
    @State private var isShowingHiText = true
    @State private var isShowingBubbleDialogue = true
    @State private var isShowingMarioName = true
    @State private var changepage = false
    
    var body: some View {
        ZStack {
            if isShowingBubbleDialogue {
                Image("BubbleDialogue")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(0.5)
                    .offset(x: 40, y: 40)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
                            withAnimation {
                                isShowingBubbleDialogue = false
                            }
                        }
                    }
            }
            
            if isShowingHiText {
                Text("Hi there!")
                    .font(.system(size: 23))
                    .offset(x: 40, y: 30)
                    .fontWeight(.medium)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            withAnimation {
                                isShowingHiText = false
                            }
                        }
                    }
            } else if isShowingMarioName {
                Text("My name is Bubble")
                    .offset(x: 45, y: 30)
                    .fontWeight(.medium)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            withAnimation {
                                isShowingMarioName = false
                                changepage = true
                            }
                        }
                    }
            }
            if changepage {
                NextPage()
            }
        }
    }
}

struct NextPage: View{
    
    var body: some View{
//        Button(" "){
            NavigationLink(destination: TutorialIntro2()){
                Label(" ", image: "home").frame(width: 400, height: 900)
                    .background(Color.clear)
            }
//        }

    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
