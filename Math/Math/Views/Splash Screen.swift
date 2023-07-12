//
//  SplashScreen.swift
//  Testing
//
//  Created by Andrew Oroh on 11/07/23.
//

import SwiftUI

struct Splash_Screen: View {
    @EnvironmentObject private var dataSeeder:DataSeeder
    
    @State private var isLoading = true
    @State private var loadingValue = 0.00
    @Binding var isRedirect:Bool
    
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
                    
                    if isLoading {
                        ProgressView(value: loadingValue)
                            .progressViewStyle(LinearProgressViewStyle())
                            .animation(.easeInOut(duration: 5.0))
                        Text("Loading...")
                            .padding(.top, 10)
                    }
                }
            }
            .onAppear {
                startLoading()
                dataSeeder.userSeeder()
                dataSeeder.subjectSeeder()
                dataSeeder.levelSeeder()
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
        @StateObject var dataSeeder:DataSeeder = DataSeeder()
        Splash_Screen(isRedirect: $isRedirected)
            .environmentObject(dataSeeder)
    }
}
