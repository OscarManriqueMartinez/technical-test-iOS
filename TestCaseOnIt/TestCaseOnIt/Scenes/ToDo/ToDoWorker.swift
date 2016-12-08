//
//  ToDoWorker.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 4/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit
import Alamofire
import JSONJoy
import CoreData


class ToDoWorker
{
  // MARK: - Business Logic
  
  func getToDos(_ userId: Int, success: @escaping (_ toDosList: [ToDo]) -> Void, failure: @escaping (_ error: Error) -> Void)
  {
    let todoEndpoint: String = "https://jsonplaceholder.typicode.com/todos?userId=\(userId)"
    Alamofire.request(todoEndpoint)
      .responseJSON { response in
        // handle JSON
        
        if let error = response.result.error {
          failure(error)
        }
        
        var toDos = [ToDo]()
        
        if let JSON = response.result.value {
          let JSONList = JSON as! NSArray
          
          for toDoDecode in JSONList{
            do {
              let toDo = try ToDo(JSONDecoder(toDoDecode))
              toDos.append(toDo)
              
            } catch {
              failure(NSError(domain: "JSONJoy", code: 1002, userInfo: [NSLocalizedDescriptionKey: "unable to parse the JSON"]) as Error)
            }
          }
          success(toDos)
        }
    }
  }
  
  // MARK: - Core Data
  
  func saveToDos(_ toDos: [ToDo], user: User) {
    let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
    
    for toDo in toDos{
      _ = CDToDo(toDo: toDo, user: user, insertInto: context)
    }
    
    CoreDataStack.sharedInstance.saveContext()
    
  }
  
  func getToDosCoreData(user: User) -> [ToDo] {
    
    let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: CDToDo.entityName())
    request.predicate = NSPredicate(format: "user.id == %d", user.id)
    
    var toDos = [ToDo]()
    
    do {
      let results = try context.fetch(request)
      
      for task in results {
        let cdTodo = task as! CDToDo
        let toDo = ToDo(cdTodo)
        toDos.append(toDo)
      }
      
    } catch let error {
      print(error.localizedDescription)
    }
    
    return toDos
  }
  
  func isToDosEmpty(user: User) -> Bool{
    
    let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: CDToDo.entityName())
    request.predicate = NSPredicate(format: "user.id == %d", user.id)
    
    do {
      let count = try context.count(for: request)
      
      if count > 0 {
        return false
        
      }else{
        return true
      }
    } catch let error {
      print(error.localizedDescription)
      return true
    }
  }
}
