//
//  AlbumInteractor.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 6/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit

protocol AlbumInteractorInput
{
  func loadImage()
  var album: Album! { get set }
}

protocol AlbumInteractorOutput
{
  func presentImages(response: AlbumResponse)
  func presentError(response: Error)
}

class AlbumInteractor: AlbumInteractorInput
{
  var album: Album!
  var images = [Image]()

  var output: AlbumInteractorOutput!
  var worker: AlbumWorker!
  
  // MARK: - Business logic
  
  func loadImage()
  {
    worker = AlbumWorker()
    worker.getImages(album.id , success: { (images) in
      
      self.images = images
      let response = AlbumResponse(images:images)
      self.output.presentImages(response: response)
      
    }, failure: {(error) in
      self.output.presentError(response: error)
      
    })
  }
}
