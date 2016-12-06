//
//  AddressAnnotation.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 6/12/16.
//  Copyright © 2016 Oscar. All rights reserved.
//

import Foundation
import MapKit

class AddressAnnotation: NSObject, MKAnnotation {
  
  var title: String? {
    return address
  }
  var subtitle: String? {
    return city
  }
  
  let address: String
  let city: String
  let coordinate: CLLocationCoordinate2D
  
  init(address: String, city: String, coordinate: CLLocationCoordinate2D) {
    self.address = address
    self.city = city
    self.coordinate = coordinate
    
    super.init()
  }
}
