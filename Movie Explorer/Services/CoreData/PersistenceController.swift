//
//  PersistenceController.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 04.10.2023.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    var context: NSManagedObjectContext {
        container.viewContext
    }
    private let container: NSPersistentContainer
    

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Movie_Explorer")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        context.automaticallyMergesChangesFromParent = true
    }
    
    func save() {
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch {
            print("Save context error: \(error.localizedDescription)")
        }
    }
}
