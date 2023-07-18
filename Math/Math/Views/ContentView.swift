//
//  ContentView.swift
//  Testing
//
//  Created by Andrew Oroh on 11/07/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var dataService:DataSeeder
    @EnvironmentObject var staticData : StaticData
    
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<UserData>
    @FetchRequest(sortDescriptors: []) var subjects: FetchedResults<SubjectData>
    @FetchRequest(sortDescriptors: []) var levels: FetchedResults<LevelData>
    
    @State var user: UserData? = nil
    
    var body: some View {
        VStack {
            // condition using modelData
            //            if username != "default"{
            // condition using static data
            if !(staticData.userData.name.isEmpty){
                NavigationView{
                    ZStack{
                        Image("HomePageBackground")
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                        VStack{
                            ZStack{
                                Image("BubbleDialogue")
                                    .scaleEffect(0.4)
                                
                                Text("Hi, \(staticData.userData.name)!")
                                    .padding(.bottom,20)
                            }.frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.height * 0.1)
                                .padding(.leading,UIScreen.main.bounds.width * 0.45)
                            
                            
                            Image("HomePageMascot")
                                .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.2)
                                .padding(.bottom, UIScreen.main.bounds.height * 0.1)
                                .scaleEffect(0.5)
                            
                            NavigationLink(destination:Game_Map()){
                                Text("\(Image(systemName: "play")) Play")
                                .frame(width: UIScreen.main.bounds.width * 0.8)
                                .foregroundColor(Color.black)
                                .padding()
                                .background(Color(hex: "B9F3FC"))
                                .cornerRadius(20)
                            }
                            
                            NavigationLink(destination: SubjectReference()){
                                Text("\(Image(systemName: "map")) Map")
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
            else{
                Text("user does not exist")
            }
            
        }.onAppear(){
            getUser()
        }
    }
    
    func getUser(){
        if !(users.isEmpty){
            user = users.first!
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var dataService:DataSeeder = DataSeeder()
        @StateObject var staticData: StaticData = StaticData()
        
        ContentView()
            .environmentObject(dataService)
            .environmentObject(staticData)
    }
}
