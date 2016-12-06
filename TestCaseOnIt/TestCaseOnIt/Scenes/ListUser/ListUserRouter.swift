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
    
    if segue.identifier == "userDetailSegue" {
      passDataToDoScene(segue, sender: sender)
    }
  }
  
  func passDataToDoScene(_ segue: UIStoryboardSegue, sender: Any?)
  {
    if let selectedUser : User = sender as! User? {

      let nextViewController = segue.destination as! UserDetailViewController
      nextViewController.output.user = selectedUser

      let backItem = UIBarButtonItem()
      backItem.title = NSLocalizedString("userDetail.back", comment: "")
      viewController.navigationItem.backBarButtonItem = backItem
    }
  }
}
