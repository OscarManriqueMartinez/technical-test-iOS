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
  
  func passDataToNextScene(_ segue: UIStoryboardSegue, sender: Any?)
  {
    // NOTE: Teach the router which scenes it can communicate with
    
    if segue.identifier == "toDoSegue" {
      passDataToDoScene(segue: segue)
      
    }else if segue.identifier == "albumSegue" {
      passDataAlbumScene(segue, sender: sender)
    }
  }
  
  func passDataToDoScene(segue: UIStoryboardSegue)
  {
    let user = viewController.output.user
    
    let nextViewController = segue.destination as! ToDoViewController
    nextViewController.output.user = user
    
    let backItem = UIBarButtonItem()
    backItem.title = user?.onlyName
    viewController.navigationItem.backBarButtonItem = backItem
  }
  
  func passDataAlbumScene(_ segue: UIStoryboardSegue, sender: Any?)
  {
    if let album : Album = sender as! Album?{
      let user = viewController.output.user
      
      let nextViewController = segue.destination as! AlbumViewController
      nextViewController.output.album = album
      
      let backItem = UIBarButtonItem()
      backItem.title = user?.onlyName
      viewController.navigationItem.backBarButtonItem = backItem
    }
  }
}
