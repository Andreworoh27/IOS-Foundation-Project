//
//  TestingApp.swift
//  Testing
//
//  Created by Andrew Oroh on 11/07/23.
//

import SwiftUI

@main
struct MathApp: App {
    //bikin object untuk connector ke core data
    @StateObject var dataSeeder:DataSeeder = DataSeeder()
    @StateObject var staticData : StaticData = StaticData()
    @State private var redirectToHomePage = false

    var body: some Scene {
        WindowGroup {
            if redirectToHomePage{
                ContentView()
                    .environment(\.managedObjectContext, dataSeeder.dataController.container.viewContext)
                    .environmentObject(staticData)
                    .environmentObject(dataSeeder)

            }
            else{
                Splash_Screen(isRedirect: $redirectToHomePage)
                    .environmentObject(dataSeeder)
            }
        }
    }
}
