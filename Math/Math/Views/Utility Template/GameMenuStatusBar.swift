//
//  GameMenuStatusBar.swift
//  Testing
//
//  Created by Andrew Oroh on 12/07/23.
//

import SwiftUI

struct GameMenuStatusBar: View {
    @EnvironmentObject var staticData : StaticData
    
    var body: some View {
        //navbar
        VStack{
            HStack{
                HStack{
                    Image(systemName: "heart").foregroundColor(.red)
                    Text("\(staticData.userData.life)")
                }.frame(width: 100, height: 40)
                    .background(Color(hex: "F8F8F8"))
                    .cornerRadius(10)
                
                Spacer().frame(width: 100)
                
                HStack{
                    Image(systemName: "dollarsign.circle")
                    Text("\(staticData.userData.currency)")
                }.frame(width: 120, height: 40)
                    .background(Color(hex: "F8F8F8"))
                    .cornerRadius(10)
            }
            .shadow(color: .gray, radius:3, x: 2, y: 2)
            .padding()
            Text("Unit \(staticData.subjectData.subjectCount) : \(staticData.subjectData.subjectTitle)")
                .font(.title2)
                .fontWeight(.bold)
            Text("\(staticData.subjectData.subjectDescription)")
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.15)
            .background(Color(hex: "D9AB80"))
    }
}

struct GameMenuStatusBar_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var staticData: StaticData = StaticData()
        
        GameMenuStatusBar()
            .environmentObject(staticData)
    }
}
