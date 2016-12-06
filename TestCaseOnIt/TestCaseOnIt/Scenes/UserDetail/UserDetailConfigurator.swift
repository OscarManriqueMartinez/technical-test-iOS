//
//  UserDetailConfigurator.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 6/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit

// MARK: - Connect View, Interactor, and Presenter

extension UserDetailViewController: UserDetailPresenterOutput
{
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    router.passDataToNextScene(segue: segue)
  }
}

extension UserDetailInteractor: UserDetailViewControllerOutput
{
}

extension UserDetailPresenter: UserDetailInteractorOutput
{
}

class UserDetailConfigurator
{
  // MARK: - Object lifecycle
  
  static let sharedInstance = UserDetailConfigurator()
  
  private init() {}
  
  // MARK: - Configuration
  
  func configure(viewController: UserDetailViewController)
  {
    let router = UserDetailRouter()
    router.viewController = viewController
    
    let presenter = UserDetailPresenter()
    presenter.output = viewController
    
    let interactor = UserDetailInteractor()
    interactor.output = presenter
    
    viewController.output = interactor
    viewController.router = router
  }
}
