//
//  UserDetailViewController.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 6/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit
import MapKit

protocol UserDetailViewControllerInput
{
  func displayUserDetail(viewModel: UserDetailViewModel)
}

protocol UserDetailViewControllerOutput
{
  func loadAlbums()
  var user: User! { get set }
}

class UserDetailViewController: UIViewController, UserDetailViewControllerInput, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate
{
  var output: UserDetailViewControllerOutput!
  var router: UserDetailRouter!
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var toDosButton: UIButton!
  
  var userDetail: UserDetailViewModel?
  
  // MARK: - Object lifecycle
  
  override func awakeFromNib()
  {
    super.awakeFromNib()
    UserDetailConfigurator.sharedInstance.configure(viewController: self)
  }
  
  // MARK: - View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    configView()
    loadAlbumsOnLoad()
  }
  
  func configView(){
    
    self.title = output.user.name

    toDosButton.setTitle(NSLocalizedString("userDetail.button.toDos", comment: ""), for: UIControlState.normal)
    
    self.tableView.estimatedRowHeight = 40.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
  }
  
  
  // MARK: - Event handling
  
  func loadAlbumsOnLoad()
  {
    output.loadAlbums()
  }
  
  // MARK: - Display logic
  
  func displayUserDetail(viewModel: UserDetailViewModel){
    
    userDetail = viewModel
    tableView.reloadData()
  }
  
  
  // MARK: - Table view data source
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if section == 0 {
      return 1
    }else{
      
      if let albums = userDetail?.albums{
        if albums.count == 0 {
          return 1 // don't have any album
          
        }else{
          return albums.count
        }
      }else{
        return 1 // error get Albums
      }
    }
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    var cell: UITableViewCell?
    
    if indexPath.section == 0 {
      let mapCell = tableView.dequeueReusableCell(withIdentifier: "mapCell") as! MapCell
      
      if let user = userDetail{
        mapCell.mapView.delegate = self
        mapCell.configCell(user.username, phone: user.phone, company: user.company, address: user.address, city: user.city, coordinate: user.coordinate)
      }
      
      return mapCell
      
    }else{
      if let albums = userDetail?.albums{
        if albums.count == 0 {
          cell = tableView.dequeueReusableCell(withIdentifier: "errorCell")! as UITableViewCell
          cell?.textLabel?.text = NSLocalizedString("userDetail.album.empty", comment: "")
          
        }else{
          cell = tableView.dequeueReusableCell(withIdentifier: "albumCell")! as UITableViewCell
          cell?.textLabel?.text = albums[indexPath.row]
        }
      }else{
        cell = tableView.dequeueReusableCell(withIdentifier: "errorCell")! as UITableViewCell
        cell?.textLabel?.text = NSLocalizedString("userDetail.album.error", comment: "")
      }
    }
    return cell!
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    
    if section == 0 {
      return 1
    
    }else{
      return 40
    }
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
    if section == 0 {
      return nil
    
    }else{
      let cell = tableView.dequeueReusableCell(withIdentifier: "albumHeader") as! AlbumHeaderCell
      cell.configCell(NSLocalizedString("userDetail.album", comment: ""))
      return cell
    }
  }
  
  
  // MARK: - Map delegate
  
  func mapView(_ mapView: MKMapView,
               viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    if let annotation = annotation as? AddressAnnotation {
      let identifier = "addressPin"
      var view: MKPinAnnotationView
      if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        as? MKPinAnnotationView { // 2
        dequeuedView.annotation = annotation
        view = dequeuedView
      } else {
        // 3
        view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        view.canShowCallout = true
        view.calloutOffset = CGPoint(x: -5, y: 5)
        view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
      }
      return view
    }
    return nil
  }
}
