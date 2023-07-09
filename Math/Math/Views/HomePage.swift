//
//  HomePage.swift
//  Math
//
//  Created by Andrew Oroh on 07/07/23.
//

import SwiftUI
import Combine

struct HomePage: View {
    var user: User
    
    var body: some View {
        
        NavigationView{
            ZStack{
                Image("HomePageBackground")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    ZStack{
                        Image("BubbleDialogue")
                            .scaleEffect(0.4)
                        
                        Text("Hi, \(user.name)!")
                            .padding(.bottom,20)
                    }.frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.height * 0.1)
                        .padding(.leading,UIScreen.main.bounds.width * 0.45)

                    
                    Image("HomePageMascot")
                        .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.2)
                        .padding(.bottom, UIScreen.main.bounds.height * 0.1)
                        .scaleEffect(0.5)
                    
                    NavigationLink(destination:FractionMap(user:user)){
                        Button("\(Image(systemName: "play")) Play") {
                            
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.8)
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color(hex: "B9F3FC"))
                        .cornerRadius(20)
                    }
                    
                    NavigationLink(destination: SubjectReference(user: user)){
                        Button("\(Image(systemName: "map")) Map") {
                            
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.8)
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color(hex: "B9F3FC"))
                        .cornerRadius(20)
                    }
                    
                }
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {

    static var previews: some View {
        HomePage(user: user)
    }
}
