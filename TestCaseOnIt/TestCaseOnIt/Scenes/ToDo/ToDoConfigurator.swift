//
//  ToDoConfigurator.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 4/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit

// MARK: - Connect View, Interactor, and Presenter

extension ToDoViewController: ToDoPresenterOutput
{
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    router.passDataToNextScene(segue: segue)
  }
}

extension ToDoInteractor: ToDoViewControllerOutput
{
}

extension ToDoPresenter: ToDoInteractorOutput
{
}

class ToDoConfigurator
{
  // MARK: - Object lifecycle
  
  static let sharedInstance = ToDoConfigurator()
  
  private init() {}
  
  // MARK: - Configuration
  
  func configure(viewController: ToDoViewController)
  {
    let router = ToDoRouter()
    router.viewController = viewController
    
    let presenter = ToDoPresenter()
    presenter.output = viewController
    
    let interactor = ToDoInteractor()
    interactor.output = presenter
    
    viewController.output = interactor
    viewController.router = router
  }
}
