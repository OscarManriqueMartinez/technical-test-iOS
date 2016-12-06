//
//  UserDetailPresenter.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 6/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit

protocol UserDetailPresenterInput
{
  func presentUserDetail(response: AlbumsResponse)
}

protocol UserDetailPresenterOutput: class
{
  func displayUserDetail(viewModel: UserDetailViewModel)
}

class UserDetailPresenter: UserDetailPresenterInput
{
  weak var output: UserDetailPresenterOutput!
  
  // MARK: - Presentation logic
  
  func presentUserDetail(response: AlbumsResponse){
    
    var displayedAlbums: [String]?
    
    if let albums = response.albums{
      
      displayedAlbums = []
      
      for album in albums{
        displayedAlbums?.append(album.title)
      }
    }
    
    let viewModel = UserDetailViewModel(user:response.user, albums:displayedAlbums)
    output.displayUserDetail(viewModel: viewModel)
  }
}
