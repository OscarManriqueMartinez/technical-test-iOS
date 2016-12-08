//
//  CoreDataStack.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 8/12/16.
//  Copyright © 2016 Oscar. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
  
  static let sharedInstance = CoreDataStack()
  
  lazy var persistentContainer: NSPersistentContainer = {
    
    let container = NSPersistentContainer(name: "TestCaseOnIt")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
  
  func saveContext() {
    
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      
      } catch let error as NSError {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    }
  }
  
  func deleteCoreData() {
    
    let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
    let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "CDUser")
    let request = NSBatchDeleteRequest(fetchRequest: fetch)
    
    do {
      try context.execute(request)
    
    } catch let error as NSError {
      fatalError("Unresolved error \(error), \(error.userInfo)")
    }
  }
}
