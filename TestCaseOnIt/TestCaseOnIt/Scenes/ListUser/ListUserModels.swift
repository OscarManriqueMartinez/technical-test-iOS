//
//  ListUserModels.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 4/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit


struct UserListResponse
{
  var users: [User]
}

struct UserListViewModel
{
  struct DisplayedUser
  {
    var name: String
    var email: String
    var webside: String
  }
  var displayedUsers: [DisplayedUser]
}
