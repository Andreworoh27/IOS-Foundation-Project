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
        }
        
        
        
        
        
        //            struct LevelClearPage_Previews: PreviewProvider {
        //                static var previews: some View {
        //                    LevelClearPage()
        //                }
        //            }
    }
}

