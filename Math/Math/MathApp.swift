//
//  MathApp.swift
//  Math
//
//  Created by Andrew Oroh on 07/07/23.
//

import SwiftUI

@main
struct MathApp: App {
    @State private var redirectToHomePage = false
    
    var body: some Scene {
        WindowGroup {
            if redirectToHomePage {
                NavigationView {
                    HomePage()
                }
                .navigationBarBackButtonHidden(true)
            } else {
                Splash_Screen(isRedirect: $redirectToHomePage)
            }
        }
    }
}
