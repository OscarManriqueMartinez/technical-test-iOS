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
}
