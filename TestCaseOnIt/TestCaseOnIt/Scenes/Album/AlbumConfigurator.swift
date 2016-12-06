//
//  AlbumConfigurator.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 6/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit

// MARK: - Connect View, Interactor, and Presenter

extension AlbumViewController: AlbumPresenterOutput
{
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    router.passDataToNextScene(segue: segue)
  }
}

extension AlbumInteractor: AlbumViewControllerOutput
{
}

extension AlbumPresenter: AlbumInteractorOutput
{
}

class AlbumConfigurator
{
  // MARK: - Object lifecycle
  
  static let sharedInstance = AlbumConfigurator()
  
  private init() {}
  
  // MARK: - Configuration
  
  func configure(viewController: AlbumViewController)
  {
    let router = AlbumRouter()
    router.viewController = viewController
    
    let presenter = AlbumPresenter()
    presenter.output = viewController
    
    let interactor = AlbumInteractor()
    interactor.output = presenter
    
    viewController.output = interactor
    viewController.router = router
  }
}
