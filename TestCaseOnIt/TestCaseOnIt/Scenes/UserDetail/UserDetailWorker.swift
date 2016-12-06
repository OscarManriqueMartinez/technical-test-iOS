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
}
