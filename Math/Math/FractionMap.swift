//
//  FractionMap.swift
//  Math
//
//  Created by Andrew Oroh on 08/07/23.
//

import SwiftUI

struct FractionMap: View {
    @State var remainingLives: Int = 3
    @State var Currency: Int = 6500
    @State var levels:[Int] = [1,2,3,4]
    
    var body: some View {
        ZStack{
            
            VStack{
                
                //navbar
                VStack{
                    HStack{
                        HStack{
                            Image(systemName: "heart").foregroundColor(.red)
                            Text("\(remainingLives)")
                        }.frame(width: 100, height: 40)
                            .background(Color(hex: "F8F8F8"))
                            .cornerRadius(10)
                        
                        Spacer().frame(width: 100)
                        
                        HStack{
                            Image(systemName: "dollarsign.circle")
                            Text("\(Currency)")
                        }.frame(width: 120, height: 40)
                            .background(Color(hex: "F8F8F8"))
                            .cornerRadius(10)
                    }
                    .shadow(color: .gray, radius:3, x: 2, y: 2)
                    .padding()
                    Text("Unit 1 : ")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Introduction : What Is Fractions")
                    Spacer()
                }
                    .frame(width: UIScreen.main.bounds.width)
                    .background(Color(hex: "D9AB80"))
                            
                //map content
                VStack{
                    ForEach(levels, id: \.self) { level in
                        HStack{
                            if(level % 2 == 0){
                                Spacer()
                                    .frame(width: UIScreen.main.bounds.width * 0.5)

                            }

                            Button("\(level)") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                            }
                            .font(.title3)
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width * 0.15,height: UIScreen.main.bounds.width * 0.15)
                                .background(Color(hex: "9C3434"))
                                .padding()
                            if(level % 2 != 0){
                                Spacer()
                                    .frame(width: UIScreen.main.bounds.width * 0.5)
                            }
                        }.padding()
                    }
                    
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height * 0.7)
                
            }
        }
    }
}

struct FractionMap_Previews: PreviewProvider {
    static var previews: some View {
        FractionMap()
    }
}
