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
  func loadToDos(type: ToDoType)
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
  var toDos = [ToDo]()
  
  // MARK: - Business logic
  
  func loadToDos(type: ToDoType)
  {
    // NOTE: Create some Worker to do the work
    
    worker = ToDoWorker()
    
    switch type {
    case ToDoType.all:
      
      if worker.isToDosEmpty(user: user){
        
        worker.getToDos(user.id , success: { (toDos) in
          
          self.worker.saveToDos(toDos, user: self.user)
          self.sendToDos(toDos: toDos)
          
        }, failure: {(error) in
          self.output.presentError(response: error)
          
        })
      }else{
        
        let toDos = worker.getToDosCoreData(user:user)
        if toDos.count > 0 {
          sendToDos(toDos: toDos)
        }
      }
      
      break;
      
    case ToDoType.pending:
      
      let response = ToDosResponse(toDos:toDos.filter { $0.completed == false })
      self.output.presentToDos(response: response)
      
      break;
      
    case ToDoType.completed:
      
      let response = ToDosResponse(toDos:toDos.filter { $0.completed == true })
      self.output.presentToDos(response: response)
      
      break;
    }
  }
  
  func sendToDos(toDos: [ToDo]) {
    self.toDos = toDos
    let response = ToDosResponse(toDos:toDos)
    self.output.presentToDos(response: response)
    
  }
}
