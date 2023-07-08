//
//  ContentView.swift
//  Math
//
//  Created by Andrew Oroh on 07/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomePage().tabItem(){
                Image(systemName: "house.fill")
            }
            SubjectReference().tabItem(){
                Image(systemName: "book.fill")
            }
            AuthenticationPage().tabItem(){
                Image(systemName: "cart.fill")
            }
            AuthenticationPage().tabItem(){
                Image(systemName: "person.fill")
            }
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
