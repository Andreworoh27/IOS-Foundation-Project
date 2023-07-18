//
//  InGameStatusBar.swift
//  Testing
//
//  Created by Andrew Oroh on 12/07/23.
//

import SwiftUI

struct InGameStatusBar: View {
    @EnvironmentObject var staticData : StaticData

    let progress: Double // Value between 0 and 1 representing the progress
    let checkpoints: [Double] // Array of values between 0 and 1 representing checkpoint progress
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "heart").foregroundColor(.red)
                    Text("\(staticData.userData.life)")
                }
                .frame(width: UIScreen.main.bounds.width * 0.25, height: 40)
                .background(Color(hex: "F8F8F8"))
                .cornerRadius(10)
                
                Spacer().frame(width: UIScreen.main.bounds.width * 0.1)
                
                HStack {
                    Image(systemName: "dollarsign.circle")
                    Text("\(staticData.userData.currency)")
                }
                .frame(width: UIScreen.main.bounds.width * 0.25, height: 40)
                .background(Color(hex: "F8F8F8"))
                .cornerRadius(10)
                
                Spacer().frame(width: UIScreen.main.bounds.width * 0.1)
                
                HStack {
                    Image(systemName: "flame")
                    Text("\(staticData.userData.streak)")
                }
                .frame(width: UIScreen.main.bounds.width * 0.25, height: 40)
                .background(Color(hex: "F8F8F8"))
                .cornerRadius(10)
            }
            .frame(width: UIScreen.main.bounds.width)
            .shadow(color: .gray, radius: 3, x: 2, y: 2)
            .padding()
            
            // Progress bar
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(height: 10)
                    .foregroundColor(.white)
                
                Rectangle()
                    .frame(width: CGFloat(progress) * UIScreen.main.bounds.width, height: 10)
                    .foregroundColor(.blue)
                
                // Checkpoints
                ForEach(checkpoints, id: \.self) { checkpoint in
                    let checkpointWidth = CGFloat(checkpoint) * UIScreen.main.bounds.width
                    
                    Rectangle()
                        .frame(width: 2, height: 14)
                        .foregroundColor(.white)
                        .offset(x: checkpointWidth - 1, y: -2)
                }
            }
            .background(.blue)
            .cornerRadius(5)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.15)
        .background(Color.clear)
    }
}

struct InGameStatusBar_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var staticData: StaticData = StaticData()

        InGameStatusBar(progress: 0.5, checkpoints: [0.22,0.66,0.95])
            .environmentObject(staticData)
    }
}
