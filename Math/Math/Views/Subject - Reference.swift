//
//  ViewC.swift
//  Trial1
//
//  Created by Lucas Salvacio Husada on 05/07/23.
//

import SwiftUI

struct SubjectReference: View {
    @State var user: User
    @State var showSheet = true
    
    var body: some View {
        NavigationView (){
            VStack{
                HStack{
                    HStack{
                        Image(systemName: "heart").foregroundColor(.red)
                        Text("\(user.life)")
                    }.frame(width: 100, height: 40)
                        .background(Color.white)
                        .cornerRadius(10)
                    
                    Spacer().frame(width: 100)
                    
                    HStack{
                        Image(systemName: "dollarsign.circle")
                        Text("\(user.currency)")
                    }.frame(width: 120, height: 40)
                        .background(Color.white)
                        .cornerRadius(10)
                }.padding(.bottom, 100)
                    .shadow(color: .gray, radius:3, x: 2, y: 2)
                HStack{
                    Text("What subject do you want to learn today?")
                        .font(Font.headline.weight(.bold))
                }.padding(.bottom, 50)
                
                Spacer().frame(height: 30)
                
                HStack{
                    Button("Select Subject"){
                        showSheet.toggle()
                    }.buttonStyle(.borderedProminent)
                        .background(Color.blue)
                        .cornerRadius(8)
                }.padding(.bottom, 100)
                Spacer().frame(height: 300)
                
            }
            .sheet(isPresented: $showSheet){
                SubjectSheet()
                    .presentationCornerRadius(50)
                    .presentationDetents([.medium])
                    .presentationBackgroundInteraction(.disabled)
            }.frame(width: 400, height: 760).background(Color(hex: "E1F7FE"))
        }
    }
}

struct SubjectSheet: View {
    var body: some View{
        VStack{
            Capsule()
                .fill(Color.secondary)
                .frame(width: 70, height: 3)
                .padding(10)
                .opacity(0.8)
            
            Spacer().frame(height: 20)

            
            ZStack{
                VStack{
                    HStack{
                        Button("Subject: Fractions") {
                            
                        }.frame(width: 300, height: 70)
                            .background(Color(hex: "FDE8B3"))
                            .foregroundColor(Color(hex: "474141"))
                            .cornerRadius(8)
                            .shadow(radius:3, x: 2, y: 2)
                    }
                    
                    Spacer().frame(height: 20)
                    
                    HStack{
                        Button("Subject: Function") {
                            
                        }.frame(width: 300, height: 70)
                            .background(Color(hex: "FFF59D"))
                            .foregroundColor(Color(hex: "474141"))
                            .cornerRadius(8)
                            .shadow(radius:3, x: 2, y: 2)
                    }
                    
                    Spacer().frame(height: 20)
                    
                    HStack{
                        Button("Subject: Integers") {
                            
                        }.frame(width: 300, height: 70)
                            .background(Color(hex: "FFCA7B"))
                            .foregroundColor(Color(hex: "474141"))
                            .cornerRadius(8)
                            .shadow(radius:3, x: 2, y: 2)
                    }
                    
                    Spacer().frame(height: 20)
                    
                    HStack{
                        Button("Subject: Algebra") {
                            
                        }.frame(width: 300, height: 70)
                            .background(Color(hex: "E7C6A7"))
                            .foregroundColor(Color(hex: "474141"))
                            .cornerRadius(8)
                            .shadow(radius:3, x: 2, y: 2)
                    }
                    
                    Spacer()
                }
                Image("PizzaSkater")
                    .position(x: 320, y: 35)
            }
        }
    }
}



struct SubjectReference_Previews: PreviewProvider {
    static var previews: some View {
        SubjectReference(user: user)
    }
}
