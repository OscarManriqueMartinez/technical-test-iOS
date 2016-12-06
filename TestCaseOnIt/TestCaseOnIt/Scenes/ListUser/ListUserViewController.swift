//
//  ListUserViewController.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 4/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit

protocol ListUserViewControllerInput
{
  func displayListUser(viewModel: UserListViewModel)
  func displayListUserFilter(viewModel: UserListViewModel)
  func displayError(description: String)
}

protocol ListUserViewControllerOutput
{
  func loadUser()
  func searchUser(text: String)
  var users: [User] { get }
  var filteredUsers: [User] { get }
}

class ListUserViewController: UIViewController, ListUserViewControllerInput, UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource
{
  var output: ListUserViewControllerOutput!
  var router: ListUserRouter!
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var errorLabel: UILabel!
  let searchController = UISearchController(searchResultsController: nil)
  
  var refreshControl: UIRefreshControl!
  var displayedUsers: [UserListViewModel.DisplayedUser] = []
  var filteredUsers: [UserListViewModel.DisplayedUser] = []

  
  // MARK: - Object lifecycle
  
  override func awakeFromNib()
  {
    super.awakeFromNib()
    ListUserConfigurator.sharedInstance.configure(viewController: self)
  }
  
  
  // MARK: - View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    configView()
    loadUserOnLoad()
  }
  
  func configView(){

    self.title = NSLocalizedString("listUser.title", comment: "")
    
    refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(ListUserViewController.refresh(_:)), for: UIControlEvents.valueChanged)
    tableView.addSubview(refreshControl)
    
    searchController.searchResultsUpdater = self
    searchController.dimsBackgroundDuringPresentation = false
    definesPresentationContext = true
    tableView.tableHeaderView = searchController.searchBar
  }
  
  
  // MARK: - UISearchResultsUpdating
  
  func updateSearchResults(for searchController: UISearchController) {
    output.searchUser(text: searchController.searchBar.text!)
  }
  
  // MARK: - Event handling
  
  func loadUserOnLoad()
  {    
    output.loadUser()
  }
  
  func refresh(_ sender:AnyObject) {
    // Code to refresh table view
    loadUserOnLoad()
  }
  
  
  // MARK: - Display logic
  
  func displayListUser(viewModel: UserListViewModel)
  {
    displayedUsers = viewModel.displayedUsers
    tableView.reloadData()
    self.errorLabel.isHidden = true
    refreshControl.endRefreshing()
  }
  
  func displayListUserFilter(viewModel: UserListViewModel)
  {
    filteredUsers = viewModel.displayedUsers
    tableView.reloadData()
  }
  
  func displayError(description: String){
    
    self.errorLabel.isHidden = false
    self.errorLabel?.text = description
  }
  
  
  // MARK: - Table view data source
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if searchController.isActive && searchController.searchBar.text != "" {
      return filteredUsers.count
    }
    
    return displayedUsers.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "listUserCell") as! ListUserCell
    
    var displayedUser: UserListViewModel.DisplayedUser
    
    if searchController.isActive && searchController.searchBar.text != "" {
      displayedUser = filteredUsers[(indexPath as NSIndexPath).row]
    }else{
      displayedUser = displayedUsers[(indexPath as NSIndexPath).row]
    }
    
    cell.configCell(displayedUser.name, email: displayedUser.email, website: displayedUser.website)
    return cell
  }

  
  // MARK: - Table view delegate
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.deselectRow(at: indexPath, animated: true)
    
    var user: User
    
    if searchController.isActive && searchController.searchBar.text != "" {
      user = self.output.filteredUsers[(indexPath as NSIndexPath).row]
    }else{
      user = self.output.users[(indexPath as NSIndexPath).row]
    }
    
    self.performSegue(withIdentifier: "userDetailSegue", sender: user)
  }
  
}
