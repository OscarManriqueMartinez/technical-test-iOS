//
//  ListUserInteractor.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 4/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit

protocol ListUserInteractorInput
{
  func loadUser()
}

protocol ListUserInteractorOutput
{
  func presentListUser(response: UserListResponse)
  func presentError(response: Error)
}

class ListUserInteractor: ListUserInteractorInput
{
  var output: ListUserInteractorOutput!
  var worker: ListUserWorker!
  var users: [User]?
  
  // MARK: - Business logic
  
  func loadUser()
  {
    // NOTE: Create some Worker to do the work
    
    worker = ListUserWorker()
    worker.getUser({ (users) in
      
      self.users = users
      let response = UserListResponse(users:users)
      self.output.presentListUser(response: response)
      
    }, failure: {(error) in
      self.output.presentError(response: error)
      
    })
  }
}
