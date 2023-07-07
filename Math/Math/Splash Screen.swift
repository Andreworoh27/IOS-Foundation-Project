//
//  Splash Screen.swift
//  Math
//
//  Created by Andrew Oroh on 07/07/23.
//

import SwiftUI

struct Splash_Screen: View {
    @State private var isLoading = true
    @State private var loadingValue = 0.00
    @State private var redirectToAuthPage = false
    @State private var isAnimating = false

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Image("SplashScreenBackground")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Image("SpashScreenMascot")
                            .scaleEffect(0.5)
                        
                        if isLoading {
                            ProgressView(value: loadingValue)
                                .progressViewStyle(LinearProgressViewStyle())
                                .animation(.easeInOut(duration: 5.0), value: isAnimating)
                            Text("Loading...")
                                .padding(.top, 10)
                        }
                    }
                }
                .onAppear {
                    startLoading()
                }
                .navigationBarHidden(true)
                .background(
                    NavigationLink(destination: AuthenticationPage(), isActive: $redirectToAuthPage) {
                        EmptyView()
                    }
                )
            }
        }.navigationBarBackButtonHidden(true)
    }
    func startLoading() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            loadingValue += 0.1
            
            if loadingValue >= 1.0 {
                timer.invalidate()
                redirectToAuthPage = true
            }
        }
        
    }
}

struct Splash_Screen_Previews: PreviewProvider {
    static var previews: some View {
        Splash_Screen()
    }
}
