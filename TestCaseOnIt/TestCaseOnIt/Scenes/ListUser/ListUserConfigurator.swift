//
//  ListUserConfigurator.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 4/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit

// MARK: - Connect View, Interactor, and Presenter

extension ListUserViewController: ListUserPresenterOutput
{
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    router.passDataToNextScene(segue: segue)
  }
}

extension ListUserInteractor: ListUserViewControllerOutput
{
}

extension ListUserPresenter: ListUserInteractorOutput
{
}

class ListUserConfigurator
{
  // MARK: - Object lifecycle
  
  static let sharedInstance = ListUserConfigurator()
  
  private init() {}
  
  // MARK: - Configuration
  
  func configure(viewController: ListUserViewController)
  {
    let router = ListUserRouter()
    router.viewController = viewController
    
    let presenter = ListUserPresenter()
    presenter.output = viewController
    
    let interactor = ListUserInteractor()
    interactor.output = presenter
    
    viewController.output = interactor
    viewController.router = router
  }
}
