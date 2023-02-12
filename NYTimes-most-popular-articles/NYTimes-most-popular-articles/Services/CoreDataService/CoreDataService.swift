//
//  CoreDataService.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 11.02.2023.
//

import Foundation
import CoreData

class CoreDataService {
    
    // MARK: - Constants
    private enum Constants {
        static let coreDatStorageName = "ArticleCoreDataModel"
    }
    
    //MARK: - Persistent Container
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: Constants.coreDatStorageName)
        container.loadPersistentStores { storeDiscription, error in
            if let error = error { fatalError("Unresolved error. \nReinstall the app.") }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        return container
    }()
    
    // MARK: - Supporting Context
    private lazy var supportingManagedObjectContext: NSManagedObjectContext = {
        let context = persistentContainer.newBackgroundContext()
        context.automaticallyMergesChangesFromParent = true
        
        return context
    }()
    
    // MARK: - Logic
    
    func saveContext(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    func getContext(main: Bool = false) -> NSManagedObjectContext {
        return main ? persistentContainer.viewContext : supportingManagedObjectContext
    }
}
