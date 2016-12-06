//
//  UserDetailRouter.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 6/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit

protocol UserDetailRouterInput
{
  func navigateToSomewhere()
}

class UserDetailRouter: UserDetailRouterInput
{
  weak var viewController: UserDetailViewController!
  
  // MARK: - Navigation
  
  func navigateToSomewhere()
  {
  }
  
  // MARK: - Communication
  
  func passDataToNextScene(segue: UIStoryboardSegue)
  {
    // NOTE: Teach the router which scenes it can communicate with
    
    if segue.identifier == "toDoSegue" {
      passDataToDoScene(segue: segue)
    }
  }
  
  func passDataToDoScene(segue: UIStoryboardSegue)
  {
    let user = viewController.output.user
    
    let nextViewController = segue.destination as! ToDoViewController
    nextViewController.output.user = user
    
    let backItem = UIBarButtonItem()
    backItem.title = user?.name
    viewController.navigationItem.backBarButtonItem = backItem
  }
}
