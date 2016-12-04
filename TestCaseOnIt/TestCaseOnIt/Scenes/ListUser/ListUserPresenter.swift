//
//  ListUserPresenter.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 4/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit

protocol ListUserPresenterInput
{
  func presentListUser(response: UserListResponse)
  func presentError(response: Error)
}

protocol ListUserPresenterOutput: class
{
  func displayListUser(viewModel: UserListViewModel)
  func displayError(description: String)
}

class ListUserPresenter: ListUserPresenterInput
{
  weak var output: ListUserPresenterOutput!
  
  // MARK: - Presentation logic
  
  func presentListUser(response: UserListResponse)
  {

    var displayedUsers: [UserListViewModel.DisplayedUser] = []
    
    for user in response.users {
      
      let displayedUser = UserListViewModel.DisplayedUser(name: user.name, email: user.email, webside: user.website)
      displayedUsers.append(displayedUser)
    }
    
    let viewModel = UserListViewModel(displayedUsers: displayedUsers)
    output.displayListUser(viewModel: viewModel)
  }
  
  func presentError(response: Error){
    
    output.displayError(description: response.localizedDescription)
  }
}
