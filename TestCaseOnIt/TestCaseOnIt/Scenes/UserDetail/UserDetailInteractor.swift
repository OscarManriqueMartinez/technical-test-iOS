//
//  UserDetailInteractor.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 6/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit

protocol UserDetailInteractorInput
{
  func loadAlbums()
  var albums: [Album] { get }
  var user: User! { get set }
}

protocol UserDetailInteractorOutput
{
    func presentUserDetail(response: AlbumsResponse)
}

class UserDetailInteractor: UserDetailInteractorInput
{
  var user: User!
  var albums = [Album]()

  var output: UserDetailInteractorOutput!
  var worker: UserDetailWorker!
  
  // MARK: - Business logic
  
  func loadAlbums()
  {
    
    worker = UserDetailWorker()
    
    if worker.isAlbumsEmpty(user: user) {
      
      worker.getAlbums(user.id , success: { (albums) in
        
        self.worker.saveAlbums(albums, user: self.user)
        self.sendAlbum(albums: albums)
        
      }, failure: {(error) in
        let response = AlbumsResponse(user:self.user)
        self.output.presentUserDetail(response:response)
      })
    }else{
      
      let albums = worker.getAlbumsCoreData(user:user)
      if albums.count > 0 {
        sendAlbum(albums: albums)
      }
    }
  }
  
  func sendAlbum(albums: [Album]) {
    self.albums = albums
    let response = AlbumsResponse(user:self.user, albums:albums)
    self.output.presentUserDetail(response: response)

  }
  
}
