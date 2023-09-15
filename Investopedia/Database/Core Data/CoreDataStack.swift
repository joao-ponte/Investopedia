//
//  CoreDataStack.swift
//  Investopedia
//
//  Created by João Ponte on 15/09/2023.
//

import CoreData

struct CoreDataStack {

    static let context = persistentContainer.viewContext

    private static let persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "Investopedia")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}
