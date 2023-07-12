//
//  CoreDataSeeder.swift
//  Math
//
//  Created by Andrew Oroh on 10/07/23.
//

import Foundation

class DataSeeder: ObservableObject {
    
    @Published var dataController: DataController = DataController()
    
    init(){
        userSeeder()
        levelSeeder()
        subjectSeeder()
    }
    
//     user seeder
    func userSeeder(){
        // Create and save initial data objects
        let context = dataController.container.viewContext
        let user = UserData(context: context)
        user.name = "User 1"
        user.currency = 0
        user.currentLevelCount = 1
        user.life = 3
        user.streak = 0
    
        do {
            try context.save()
        } catch {
            // Handle error if saving fails
            print("Failed to seed user data: \(error)")
        }
    }
    
    // subject seeder
    func subjectSeeder(){
        let context = dataController.container.viewContext
        let subject = SubjectData(context: context)
        subject.colorHex = "FDE8B3"
        subject.subjectCategory = "Fraction"
        subject.subjectCount = 1
        subject.subjectDescription = "Introduction : What Is Fraction"
        subject.subjectLevelCount = 4
        subject.subjectTitle = "Fractions"
    
        do {
            try context.save()
        } catch {
            // Handle error if saving fails
            print("Failed to seed subject data: \(error)")
        }
    }
    
    // level seeder
    func levelSeeder(){
        let context = dataController.container.viewContext
        let level = LevelData(context: context)
        level.currencyReward = 10
        level.levelCategory = "Fraction"
        level.levelCount = 1
        level.levelDescription = "Learning basic concept of fraction"
        level.levelDisplayNumber = 1
        level.levelTitle = "Introduction To Fractions"
    
        do {
            try context.save()
        } catch {
            // Handle error if saving fails
            print("Failed to seed level data: \(error)")
        }
    }
    
}
