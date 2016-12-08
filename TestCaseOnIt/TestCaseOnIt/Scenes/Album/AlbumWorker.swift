//
//  AlbumWorker.swift
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

class AlbumWorker
{
  // MARK: - Business Logic
  
  func getImages(_ albumId: Int, success: @escaping (_ imageList: [Image]) -> Void, failure: @escaping (_ error: Error) -> Void)
  {
    let todoEndpoint: String = "https://jsonplaceholder.typicode.com/photos?albumId=\(albumId)"
    Alamofire.request(todoEndpoint)
      .responseJSON { response in
        // handle JSON
        
        if let error = response.result.error {
          failure(error)
        }
        
        var images = [Image]()
        
        if let JSON = response.result.value {
          let JSONList = JSON as! NSArray
          
          for imageDecode in JSONList{
            do {
              let image = try Image(JSONDecoder(imageDecode))
              images.append(image)
              
            } catch {
              failure(NSError(domain: "JSONJoy", code: 1002, userInfo: [NSLocalizedDescriptionKey: "unable to parse the JSON"]) as Error)
            }
          }
          success(images)
        }
    }
  }
  
  // MARK: - Core Data
  
  func saveImages(_ images: [Image], album: Album) {
    let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
    
    for image in images{
      _ = CDImage(image: image, album: album, insertInto: context)
    }
    
    CoreDataStack.sharedInstance.saveContext()
    
  }
  
  func getImagesCoreData(album: Album) -> [Image] {
    
    let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: CDImage.entityName())
    request.predicate = NSPredicate(format: "album.id == %d", album.id)
    
    var images = [Image]()
    
    do {
      let results = try context.fetch(request)
      
      for task in results {
        let cdImage = task as! CDImage
        let image = Image(cdImage)
        images.append(image)
      }
      
    } catch let error {
      print(error.localizedDescription)
    }
    
    return images
  }
  
  func isImagesEmpty(album: Album) -> Bool{
    
    let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: CDImage.entityName())
    request.predicate = NSPredicate(format: "album.id == %d", album.id)
    
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
