//
//  ToDoViewController.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 4/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit

enum ToDoType: Int {
  case pending = 0
  case completed
  case all
}


protocol ToDoViewControllerInput
{
  func displayListUser(viewModel: ToDosViewModel)
  func displayError(description: String)
}

protocol ToDoViewControllerOutput
{
  func loadToDos(type: ToDoType)
  var user: User! { get set }
}

class ToDoViewController: UIViewController, ToDoViewControllerInput, UITableViewDelegate, UITableViewDataSource
{
  var output: ToDoViewControllerOutput!
  var router: ToDoRouter!
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var errorLabel: UILabel!
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  
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
    configView()
    loadToDosOnLoad()
  }
  
  func configView(){
    
    segmentedControl.setTitle(NSLocalizedString("todos.segmente.pending", comment: ""), forSegmentAt: 0)
    segmentedControl.setTitle(NSLocalizedString("todos.segmente.completed", comment: ""), forSegmentAt: 0)
    segmentedControl.addTarget(self, action: #selector(ToDoViewController.action), for: .valueChanged)
  }
  
  // MARK: - Event handling
  
  func loadToDosOnLoad()
  {
    output.loadToDos(type: ToDoType.all)
  }
  
  // MARK: - Display logic
  
  func action() {
    
    output.loadToDos(type: ToDoType(rawValue: segmentedControl.selectedSegmentIndex)!)
  }
  
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
