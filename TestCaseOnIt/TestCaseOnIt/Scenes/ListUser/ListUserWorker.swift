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

class ListUserWorker
{
  // MARK: - Business Logic
  
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
          
          for chatDecode in JSONList{
            do {
              let user = try User(JSONDecoder(chatDecode))
              users.append(user)
              print(user)
              
            } catch {
              failure(NSError(domain: "JSONJoy", code: 1002, userInfo: [NSLocalizedDescriptionKey: "unable to parse the JSON"]) as Error)
            }
          }
          success(users)
        }
    }
  }
}
