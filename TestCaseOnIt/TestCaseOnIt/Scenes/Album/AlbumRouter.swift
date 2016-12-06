//
//  AlbumRouter.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 6/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit

protocol AlbumRouterInput
{
  func navigateToSomewhere()
}

class AlbumRouter: AlbumRouterInput
{
  weak var viewController: AlbumViewController!
  
  // MARK: - Navigation
  
  func navigateToSomewhere()
  {
  }
  
  // MARK: - Communication
  
  func passDataToNextScene(segue: UIStoryboardSegue)
  {
  }

}
