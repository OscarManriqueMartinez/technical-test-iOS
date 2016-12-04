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
  var isFilter: Bool
}

struct UserListViewModel
{
  struct DisplayedUser
  {
    var name: String
    var email: String
    var website: String
  }
  var displayedUsers: [DisplayedUser]
}
