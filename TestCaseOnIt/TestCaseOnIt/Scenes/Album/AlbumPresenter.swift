//
//  AlbumPresenter.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 6/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit

protocol AlbumPresenterInput
{
  func presentImages(response: AlbumResponse)
  func presentError(response: Error)
}

protocol AlbumPresenterOutput: class
{
  func displayImages(viewModel: AlbumViewModel)
  func displayError(description: String)
}

class AlbumPresenter: AlbumPresenterInput
{
  weak var output: AlbumPresenterOutput!
  
  // MARK: - Presentation logic
  
  func presentImages(response: AlbumResponse){
    
    var displayedImages: [String] = []
    
    for image in response.images {
      
      displayedImages.append(image.thumbnailUrl)
    }
    
    let viewModel = AlbumViewModel(imagesUrl: displayedImages)
    output.displayImages(viewModel: viewModel)
  }
  
  func presentError(response: Error){
    
    output.displayError(description: response.localizedDescription)
  }
}
