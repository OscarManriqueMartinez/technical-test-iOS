//
//  ToDoPresenter.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 4/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit

protocol ToDoPresenterInput
{
  func presentToDos(response: ToDosResponse)
  func presentError(response: Error)
}

protocol ToDoPresenterOutput: class
{
  func displayListUser(viewModel: ToDosViewModel)
  func displayError(description: String)
}

class ToDoPresenter: ToDoPresenterInput
{
  weak var output: ToDoPresenterOutput!
  
  
  // MARK: - Presentation logic
  
  func presentToDos(response: ToDosResponse){
    
    var displayedToDos: [String] = []
    
    for toDo in response.toDos {
      
      displayedToDos.append(toDo.title)
    }
    
    let viewModel = ToDosViewModel(DisplayedToDos: displayedToDos)
    output.displayListUser(viewModel: viewModel)
    
  }
  
  func presentError(response: Error){
    
    output.displayError(description: response.localizedDescription)
  }
}
