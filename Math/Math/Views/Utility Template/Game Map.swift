//
//  Game Map.swift
//  Testing
//
//  Created by Andrew Oroh on 11/07/23.
//

import SwiftUI

struct Game_Map: View {
    @EnvironmentObject private var dataService:DataSeeder
    @EnvironmentObject var staticData : StaticData
    
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<UserData>
    @FetchRequest(sortDescriptors: []) var subjects: FetchedResults<SubjectData>
    @FetchRequest(sortDescriptors: []) var levels: FetchedResults<LevelData>
    
    var body: some View {
        VStack{
            GameMenuStatusBar()
            
            //map content
            ScrollView{
                ForEach(0..<Int((staticData.subjectData.subjectLevelCount ))) { level in
                    HStack{
                        if(level % 2 == 0){
                            Spacer()
                                .frame(width: UIScreen.main.bounds.width * 0.5)
                        }
                        
                        if level+1 == 1 {
                            NavigationLink(destination: MainView()){
                                Text("\(level+1)")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .frame(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15)
                                    .background(Color(hex: "9C3434"))
                                    .clipShape(Circle())
                                    .padding()
                            }
                        }
                        else {
                            NavigationLink(destination: ComingSoon()){
                                Text("\(level+1)")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .frame(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15)
                                    .background(Color(hex: "9C3434"))
                                    .clipShape(Circle())
                                    .padding()
                            }
                        }
                        if(level % 2 != 0){
                            Spacer()
                                .frame(width: UIScreen.main.bounds.width * 0.5)
                        }
                    }.padding()
                }
                Spacer()
            }
        }
    }
}

struct Game_Map_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var dataService:DataSeeder = DataSeeder()
        @StateObject var staticData: StaticData = StaticData()
        
        Game_Map()
            .environmentObject(dataService)
            .environmentObject(staticData)
    }
}
