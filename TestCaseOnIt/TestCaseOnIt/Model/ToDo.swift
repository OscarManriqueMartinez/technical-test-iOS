//
//  ToDo.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 4/12/16.
//  Copyright © 2016 Oscar. All rights reserved.
//

import JSONJoy


struct ToDo : JSONJoy {

  let userId: Int
  let id: Int
  let title: String
  let completed: Bool
  
  
  init(_ decoder: JSONDecoder) throws {

    userId = try decoder["userId"].get()
    id = try decoder["id"].get()
    title = try decoder["title"].get()
    completed = try decoder["completed"].get()
  }
  
  init(_ cdToDo: CDToDo){
    
    if let user = cdToDo.user {
      userId = Int(user.id!)
      
    }else{
      userId = 0
    }
    id = Int(cdToDo.id!)
    title = cdToDo.title!
    completed = Bool(cdToDo.completed!)
  }
}
