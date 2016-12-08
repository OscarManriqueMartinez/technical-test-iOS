//
//  ListUserWorker.swift
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

class ListUserWorker
{
  // MARK: - Web service
  
  func getUser(_ success: @escaping (_ users: [User]) -> Void, failure: @escaping (_ error: Error) -> Void)
  {
    let todoEndpoint: String = "https://jsonplaceholder.typicode.com/users"
    Alamofire.request(todoEndpoint)
      .responseJSON { response in
        // handle JSON
        
        if let error = response.result.error {
          failure(error)
        }
        
        var users = [User]()
        
        if let JSON = response.result.value {
          let JSONList = JSON as! NSArray
          
          for userDecode in JSONList{
            do {
              let user = try User(JSONDecoder(userDecode))
              users.append(user)
              
            } catch {
              failure(NSError(domain: "JSONJoy", code: 1002, userInfo: [NSLocalizedDescriptionKey: "unable to parse the JSON"]) as Error)
            }
          }
          success(users)
        }
    }
  }
  
  
  // MARK: - Core Data
  
  func saveUsers(_ users: [User]) {
    let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
    
    for user in users{
      _ = CDUser(user: user, insertInto: context)
    }
    
    CoreDataStack.sharedInstance.saveContext()
  }
  
  func getUserCoreData() -> [User] {
    
    let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: CDUser.entityName())
    var users = [User]()
    
    do {
      let results = try context.fetch(request)
      
      for task in results {
        let cdUser = task as! CDUser
        let user = User(cdUser)
        users.append(user)
      }
    
    } catch let error {
      print(error.localizedDescription)
    }
    
    return users
  }
  
  func isUserEmpty() -> Bool{
    
    let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: CDUser.entityName())
    
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
