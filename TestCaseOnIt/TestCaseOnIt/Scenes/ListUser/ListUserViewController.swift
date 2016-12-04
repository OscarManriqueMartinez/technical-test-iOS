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
}

protocol ListUserViewControllerOutput
{
  func loadUser()
}

class ListUserViewController: UIViewController, ListUserViewControllerInput, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource
{
  var output: ListUserViewControllerOutput!
  var router: ListUserRouter!
  
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var tableView: UITableView!
  
  var refreshControl: UIRefreshControl!
  var displayedUsers: [UserListViewModel.DisplayedUser] = []
  
  
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
    self.title = NSLocalizedString("listUser.title", comment: "")
    self.searchBar?.placeholder = NSLocalizedString("listUser.search.placeholder", comment: "")
    
    refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(ListUserViewController.refresh(_:)), for: UIControlEvents.valueChanged)
    tableView.addSubview(refreshControl)
    
    loadUserOnLoad()
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
    refreshControl.endRefreshing()
  }
  
  
  // MARK: - Table view data source
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return displayedUsers.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "listUserCell") as! ListUserCell
    
    let displayedUser = displayedUsers[(indexPath as NSIndexPath).row]
    cell.configCell(displayedUser.name, email: displayedUser.email, webside: displayedUser.webside)
    return cell
  }

}
