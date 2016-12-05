//
//  ListUserRouter.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 4/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit

protocol ListUserRouterInput
{
  func navigateToSomewhere()
}

class ListUserRouter: ListUserRouterInput
{
  weak var viewController: ListUserViewController!
  
  // MARK: - Navigation
  
  func navigateToSomewhere()
  {
  }
  
  // MARK: - Communication
  
  func passDataToNextScene(_ segue: UIStoryboardSegue, sender: Any?)
  {
    
    if segue.identifier == "toDoSegue" {
      passDataToDoScene(segue, sender: sender)
    }
  }
  
  func passDataToDoScene(_ segue: UIStoryboardSegue, sender: Any?)
  {
    if let selectedUser : User = sender as! User? {
      let toDoViewController = segue.destination as! ToDoViewController
      toDoViewController.output.user = selectedUser
    }
  }
}
