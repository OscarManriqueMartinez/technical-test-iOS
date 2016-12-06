//
//  MapCell.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 6/12/16.
//  Copyright © 2016 Oscar. All rights reserved.
//

import UIKit
import MapKit

class MapCell: UITableViewCell {

  @IBOutlet weak var usernameValue: UILabel!
  @IBOutlet weak var usernameDescription: UILabel!
  @IBOutlet weak var phoneValue: UILabel!
  @IBOutlet weak var phoneDescription: UILabel!
  @IBOutlet weak var companyValue: UILabel!
  @IBOutlet weak var companyDescription: UILabel!
  @IBOutlet weak var mapView: MKMapView!

  override func awakeFromNib() {
    super.awakeFromNib()

    usernameDescription.text = NSLocalizedString("userDetail.username", comment: "")
    phoneDescription.text = NSLocalizedString("userDetail.phone", comment: "")
    companyDescription.text = NSLocalizedString("userDetail.company", comment: "")
    
    usernameValue.adjustsFontSizeToFitWidth = true;
    phoneValue.adjustsFontSizeToFitWidth = true;
    companyValue.adjustsFontSizeToFitWidth = true;
  }
  
  open func configCell(_ username: String, phone: String, company: String, address: String, city: String, coordinate: CLLocationCoordinate2D) {
    
    usernameValue.text = username
    phoneValue.text = phone
    companyValue.text = company
    
    let addressAnnotation = AddressAnnotation(address: address,
                          city: city,
                          coordinate: coordinate)
    
    mapView.addAnnotation(addressAnnotation)
    
    let initialLocation = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
    centerMapOnLocation(location: initialLocation)

  }
  
  let regionRadius: CLLocationDistance = 1000
  func centerMapOnLocation(location: CLLocation) {
    let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                              regionRadius * 2.0, regionRadius * 2.0)
    mapView.setRegion(coordinateRegion, animated: true)
  }
}
