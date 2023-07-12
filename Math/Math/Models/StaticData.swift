//
//  StaticData.swift
//  Math
//
//  Created by Andrew Oroh on 12/07/23.
//

import Foundation

class StaticData: ObservableObject{
    
    @Published var userData: UserDataModel = UserDataModel(name: "", life: 0, currency: 0, streak: 0, currentLevelCount: 0)
    @Published var subjectData: SubjectDataModel = SubjectDataModel(subjectCategory: "", subjectCount: 0, subjectDescription: "", subjectLevelCount: 0, subjectTitle: "", colorHex: "")
    @Published var levelData: LevelDataModel = LevelDataModel(levelDisplayNumber: 0, levelCategory: "", levelCount: 0, levelTitle: "", levelDescription: "", currencyReward: 0)
    
    init() {
        generateDataModels()
    }
    
    func generateDataModels(){
        userData = UserDataModel(name: "Rhema", life: 3, currency: 0, streak: 0, currentLevelCount: 1)
        subjectData = SubjectDataModel(subjectCategory: "Fraction", subjectCount: 1, subjectDescription: "Introduction : What Is Fraction", subjectLevelCount: 4, subjectTitle: "Fraction", colorHex: "FDE8B3")
        levelData = LevelDataModel(levelDisplayNumber: 1, levelCategory: "Fraction", levelCount: 1, levelTitle: "Introduction To Fractions", levelDescription: "Learning basic concept of fraction", currencyReward: 10)
    }
    
}
