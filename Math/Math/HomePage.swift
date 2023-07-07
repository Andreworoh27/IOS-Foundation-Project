//
//  HomePage.swift
//  Math
//
//  Created by Andrew Oroh on 07/07/23.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        ZStack{
            Image("HomePageBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack{
                ZStack{
                    Image("BubbleDialogue")
                        .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.3)
                        .background()
                        .scaleEffect(0.4)
                    Text("test")
                }
                Image("HomePageMascot")
                    .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.2)
                    .scaleEffect(0.5)
                
                Button("\(Image(systemName: "play")) Play") {
                    
                }
                .frame(width: UIScreen.main.bounds.width * 0.8)
                .foregroundColor(Color.black)
                .padding()
                .background(Color(hex: "B9F3FC"))
                .cornerRadius(20)
                
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

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
