//
//  UserDetailModels.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 6/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit
import MapKit

struct UserDetail
{
  struct Something
  {
    struct Request
    {
    }
    struct Response
    {
    }
    struct ViewModel
    {
    }
  }
}

struct AlbumsResponse
{
  var albums: [Album]?
  var user: User
  
  init(user: User, albums: [Album]) {
    self.init(user:user)
    self.albums = albums
  }
  
  init(user: User) {
    self.user = user
  }
}

struct UserDetailViewModel
{
  var username: String
  var phone: String
  var company: String
  var address: String
  var city: String
  var coordinate: CLLocationCoordinate2D
  var albums: [String]?
  
  init(user: User, albums: [String]?) {
    self.username = user.username
    self.phone = user.phone
    self.company = user.company.name
    self.address = "\(user.address.street) \(user.address.suite)"
    let lat : Double = Double(user.address.geo.lat)!
    let lng : Double = Double(user.address.geo.lng)!
    self.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lng)
    self.city = user.address.city
    self.albums = albums
  }
}
