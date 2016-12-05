//
//  ToDoInteractor.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 4/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit

protocol ToDoInteractorInput
{
  func loadToDos()
  var user: User! { get set }
}

protocol ToDoInteractorOutput
{
  func presentToDos(response: ToDosResponse)
  func presentError(response: Error)
}

class ToDoInteractor: ToDoInteractorInput
{
  var output: ToDoInteractorOutput!
  var worker: ToDoWorker!
  var user: User!
  
  // MARK: - Business logic
  
  func loadToDos()
  {
    // NOTE: Create some Worker to do the work
    
    worker = ToDoWorker()
    worker.getToDos(user.id , success: { (toDos) in
      
      let response = ToDosResponse(toDos:toDos)
      self.output.presentToDos(response: response)
      
    }, failure: {(error) in
      self.output.presentError(response: error)
      
    })
  }
}
