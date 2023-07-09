//
//  ContentView.swift
//  Math
//
//  Created by Lucas Salvacio Husada on 07/07/23.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomePage(user: user).tabItem {
                Image(systemName: "house.fill")
            }
            SubjectReference(user: user).tabItem {
                Image(systemName: "book.fill")
            }
            AuthenticationPage().tabItem {
                Image(systemName: "cart.fill")
            }
            AuthenticationPage().tabItem {
                Image(systemName: "person.fill")
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView: View {
    var body: some View {
        TabBar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
