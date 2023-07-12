//
//  DataController.swift
//  Math
//
//  Created by Andrew Oroh on 10/07/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "DataModel")
    init() {
        container.loadPersistentStores{
            description, error in if let error = error {
                print("Core Data Failed to Load \(error)")
            }
        }
    }
    
    func isCoreDataEmpty() -> Bool {
        let persistentStoreCoordinator = container.persistentStoreCoordinator
        let entities = persistentStoreCoordinator.managedObjectModel.entities
        
        for entity in entities {
            let entityName = entity.name ?? ""
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entityName)
            
            do {
                let count = try container.viewContext.count(for: fetchRequest)
                if count > 0 {
                    // At least one entity has data, Core Data is not empty
                    return false
                }
            } catch {
                print("Failed to check Core Data: \(error)")
                return false
            }
        }
        
        // All entities are empty, Core Data is empty
        return true
    }

}
