//
//  UserDetailModels.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 6/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit

struct UserDetail
{
  struct Something
  {
    struct Request
    {
    }
    struct Response
    {
    }
    struct ViewModel
    {
    }
  }
}

struct AlbumsResponse
{
  var albums: [Album]?
  var user: User
  
  init(user: User, albums: [Album]) {
    self.init(user:user)
    self.albums = albums
  }
  
  init(user: User) {
    self.user = user
  }
}

struct UserDetailViewModel
{
  var username: String
  var phone: String
  var company: String
  var albums: [String]?
  
  init(user: User, albums: [String]?) {
    self.username = user.username
    self.phone = user.phone
    self.company = user.company.name
    self.albums = albums
  }
}
