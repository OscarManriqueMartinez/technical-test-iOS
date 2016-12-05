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
}
