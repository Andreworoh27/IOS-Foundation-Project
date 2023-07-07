//
//  ViewC.swift
//  Trial1
//
//  Created by Lucas Salvacio Husada on 05/07/23.
//

import SwiftUI

struct SubjectReference: View {
    @State var remainingLives: Int = 3
    @State var Currency: Int = 1000
    @State var showSheet = true
    
    var body: some View {
        NavigationView(){
            VStack{
                HStack{
                    HStack{
                        Image(systemName: "heart").foregroundColor(.red)
                        Text("\(remainingLives)")
                    }.frame(width: 100, height: 40)
                        .background(Color.cyan)
                        .shadow(color: .gray, radius:3, x: 2, y: 2)
                        .cornerRadius(10)
                    
                    Spacer().frame(width: 100)
                    
                    HStack{
                        Image(systemName: "dollarsign.circle")
                        Text("\(Currency)")
                    }.frame(width: 100, height: 40)
                        .background(Color.pink)
                        .shadow(color: .gray, radius:3, x: 2, y: 2)
                        .cornerRadius(10)
                }.padding(.bottom, 100)
                HStack{
                    Text("What subject do you want to learn today?")
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
                
            }.sheet(isPresented: $showSheet){
                SubjectSheet()
                    .presentationDetents([.medium])
                    .presentationBackgroundInteraction(.disabled)
            }
        }
    }
}

struct SubjectSheet: View {
    var body: some View{
        VStack{
            Button("Subject: Frations") {
                
            }.frame(width: 300, height: 70)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .shadow(radius:3, x: 2, y: 2)
            Button("Subject: Function") {
                
            }.frame(width: 300, height: 70)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .shadow(radius:3, x: 2, y: 2)
            Button("Subject: Integers") {
                
            }.frame(width: 300, height: 70)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .shadow(radius:3, x: 2, y: 2)
            Button("Subject: Algebra") {
                
            }.frame(width: 300, height: 70)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .shadow(radius:3, x: 2, y: 2)
        }
    }
}



struct SubjectReference_Previews: PreviewProvider {
    static var previews: some View {
        SubjectReference()
    }
}
