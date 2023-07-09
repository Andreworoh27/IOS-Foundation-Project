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
        VStack {
            ZStack {
                Image("SplashScreenBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("SpashScreenMascot")
                        .scaleEffect(0.5)
                    
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
            }
            .onAppear {
                startLoading()
            }
        }
    }
    func startLoading() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            loadingValue += 0.1
            
            if loadingValue >= 1.0 {
                timer.invalidate()
                isRedirect = true
            }
        }
        
    }
}

struct Splash_Screen_Previews: PreviewProvider {
    @State static var isRedirected = false
    
    static var previews: some View {
        Splash_Screen(isRedirect: $isRedirected)
    }
}
