//
//  UserDetailWorker.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 6/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit
import Alamofire
import JSONJoy
import CoreData


class UserDetailWorker
{
  // MARK: - Business Logic
  
  func getAlbums(_ userId: Int, success: @escaping (_ albumList: [Album]) -> Void, failure: @escaping (_ error: Error) -> Void)
  {
    let todoEndpoint: String = "https://jsonplaceholder.typicode.com/albums?userId=\(userId)"
    Alamofire.request(todoEndpoint)
      .responseJSON { response in
        // handle JSON
        
        if let error = response.result.error {
          failure(error)
        }
        
        var albums = [Album]()
        
        if let JSON = response.result.value {
          let JSONList = JSON as! NSArray
          
          for albumDecode in JSONList{
            do {
              let album = try Album(JSONDecoder(albumDecode))
              albums.append(album)
              
            } catch {
              failure(NSError(domain: "JSONJoy", code: 1002, userInfo: [NSLocalizedDescriptionKey: "unable to parse the JSON"]) as Error)
            }
          }
          success(albums)
        }
    }
  }
  
  
  // MARK: - Core Data
  
  func saveAlbums(_ albums: [Album], user: User) {
    let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
    
    for album in albums{
      _ = CDAlbum(album: album, user: user, insertInto: context)
    }
    
    CoreDataStack.sharedInstance.saveContext()
    
  }
  
  func getAlbumsCoreData(user: User) -> [Album] {
    
    let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: CDAlbum.entityName())
    request.predicate = NSPredicate(format: "user.id == %d", user.id)
    
    var albums = [Album]()
    
    do {
      let results = try context.fetch(request)
      
      for task in results {
        let cdAlbum = task as! CDAlbum
        let album = Album(cdAlbum)
        albums.append(album)
      }
      
    } catch let error {
      print(error.localizedDescription)
    }
    
    return albums
  }
  
  func isAlbumsEmpty(user: User) -> Bool{
    
    let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: CDAlbum.entityName())
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
