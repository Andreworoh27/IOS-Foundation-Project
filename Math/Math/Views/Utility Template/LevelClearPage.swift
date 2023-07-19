//
//  LevelClearPage.swift
//  Math
//
//  Created by Romington Hydro on 18/07/23.
//

import SwiftUI

//import SwiftUI

class ValidatePage : ObservableObject {
    @Published var validate : Int = 0
}



struct FallingStarView: View {
    @State private var rotationAngle: Angle = .degrees(0)
    @State private var starOffsetX: CGFloat = 0 // Initial X offset is set to 0
    @State private var starOffsetY: CGFloat = -1000 // Start offscreen above the screen
    private let screenHeight = UIScreen.main.bounds.height
    private let screenWidth = UIScreen.main.bounds.width
    
    func delayedAnimation(delay: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            withAnimation(Animation.easeInOut(duration: 3)) {
//                starOffsetY = screenHeight / 2 - 600 // The desired final Y position higher at the middle of the screen
//                rotationAngle = .degrees(360) // Spinning the star
            }
        }
    }
    
    
    var body: some View {
        HStack{
            Image("starLeft") // Adjust the image name as per your asset name
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50) // Adjust the size of the star as per your requirement
                .rotationEffect(rotationAngle)
                .offset(x: starOffsetX, y: starOffsetY)
                .onAppear {
                    
                    withAnimation(Animation.easeInOut(duration: 3)) {
                        //starOffsetX = screenWidth / 2 - 100 // The desired final X position at the middle of the screen
                        starOffsetY = screenHeight / 2 - 600 // The desired final Y position higher at the middle of the screen
                        rotationAngle = .degrees(360) // Spinning the star
                    }
                }
            
            Image("starMid") // Adjust the image name as per your asset name
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50) // Adjust the size of the star as per your requirement
                .rotationEffect(rotationAngle)
                .offset(x: starOffsetX, y: starOffsetY)
                .onAppear {
                    delayedAnimation(delay: 3)
                        withAnimation(Animation.easeInOut(duration: 3)) {
                            //starOffsetX = screenWidth / 2 - 100 // The desired final X position at the middle of the screen
                            starOffsetY = screenHeight / 2 - 600 // The desired final Y position higher at the middle of the screen
                            rotationAngle = .degrees(360) // Spinning the star
                        }
                    
                }
            
            Image("starRight") // Adjust the image name as per your asset name
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50) // Adjust the size of the star as per your requirement
                .rotationEffect(rotationAngle)
                .offset(x: starOffsetX, y: starOffsetY)
                .onAppear {
                    delayedAnimation(delay: 3)

                    withAnimation(Animation.easeInOut(duration: 3)) {
                        //                    starOffsetX = screenWidth / 2 - 100 // The desired final X position at the middle of the screen
                        starOffsetY = screenHeight / 2 - 600 // The desired final Y position higher at the middle of the screen
                        rotationAngle = .degrees(360) // Spinning the star
                    }
                }
        }
        
        
    }
}

struct LevelClearPage: View {
    @State private var isContentViewActive = false
    @State private var isComingSoonActive = false
    @State private var buttonValidator: Bool = false
    @ObservedObject var validatePage : ValidatePage = ValidatePage()
    @State var showSheet = true
    @State var redirectToGamePage : Bool = false
    
    
    
    var body: some View {
        ZStack {
            Image("BackgroundClear")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            Image("PenguinClear")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 180)
                .padding(.top, 200)
            
            VStack {
                
                HStack{
                    
                    Button("Home"){
                        validatePage.validate = 1
                    }
                    .frame(width: 150, height: 40)
                    .background(Color(hex: "88C8E5"))
                    .foregroundColor(Color(hex: "474141"))
                    .cornerRadius(8)
                    .shadow(radius:3, x: 2, y: 2)
                    
                    Button("Next Level") {
                        validatePage.validate = 2
                    }.frame(width: 150, height: 40)
                        .background(Color(hex: "88C8E5"))
                        .foregroundColor(Color(hex: "474141"))
                        .cornerRadius(8)
                        .shadow(radius:3, x: 2, y: 2)
                }
                .padding(.top, 500)
            }
            
            
            
            Spacer()
            
                .onChange(of: validatePage.validate, perform: { newValue in
                    if newValue >= 1 {
                        redirectToGamePage = true
                        showSheet = false
                    }
                    //                    else if newValue >= 1 {
                    //                        redirectToGamePage = true
                    //                        showSheet = false
                    //                    }
                })
            
            if validatePage.validate == 1 {
                NavigationLink(destination: Game_Map(), isActive: $redirectToGamePage){
                    EmptyView()
                }
                .hidden()
            }
            else if validatePage.validate > 1 {
                NavigationLink(destination : ComingSoon(),isActive: $redirectToGamePage){
                }
            }
            Spacer()
            // ZStack for the rest of the content (other assets)
            ZStack {
                // Place other assets or content here
            }
            
            // ZStack for the FallingStarView
            ZStack {
                FallingStarView()
            }
        }
    }
    struct LevelClearPage_Previews: PreviewProvider {
        static var previews: some View {
            LevelClearPage()
        }
    }
}
