//
//  ToDoViewController.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 4/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit

protocol ToDoViewControllerInput
{
  func displayListUser(viewModel: ToDosViewModel)
  func displayError(description: String)
}

protocol ToDoViewControllerOutput
{
  func loadToDos()
  var user: User! { get set }
}

class ToDoViewController: UIViewController, ToDoViewControllerInput, UITableViewDelegate, UITableViewDataSource
{
  var output: ToDoViewControllerOutput!
  var router: ToDoRouter!
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var errorLabel: UILabel!
  
  var displayedToDos: [String] = []
  
  // MARK: - Object lifecycle
  
  override func awakeFromNib()
  {
    super.awakeFromNib()
    ToDoConfigurator.sharedInstance.configure(viewController: self)
  }
  
  // MARK: - View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    loadToDosOnLoad()
  }
  
  // MARK: - Event handling
  
  func loadToDosOnLoad()
  {
    output.loadToDos()
  }
  
  // MARK: - Display logic
  
  func displayListUser(viewModel: ToDosViewModel){
    
    displayedToDos = viewModel.DisplayedToDos
    tableView.reloadData()
    self.errorLabel.isHidden = true
  }
  
  func displayError(description: String){
    
    self.errorLabel.isHidden = false
    self.errorLabel?.text = description
  }
  
  // MARK: - Table view data source
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return displayedToDos.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell") as! ToDoCell
    cell .configCell(displayedToDos[(indexPath as NSIndexPath).row])

    return cell
  }
}
