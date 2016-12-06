//
//  User.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 4/12/16.
//  Copyright © 2016 Oscar. All rights reserved.
//

import JSONJoy


struct User : JSONJoy {
  let address: Address
  let company: Company
  let email: String
  let id: Int
  let name: String
  let phone: String
  let username: String
  let website: String
  var onlyName: String {
    let fullNameArr = name.components(separatedBy: " ")
    return fullNameArr[0]
  }
  
  init(_ decoder: JSONDecoder) throws {
    address = try Address(decoder["address"])
    company = try Company(decoder["company"])
    email = try decoder["email"].get()
    id = try decoder["id"].get()
    name = try decoder["name"].get()
    phone = try decoder["phone"].get()
    username = try decoder["username"].get()
    website = try decoder["website"].get()
  }
	
  
}

struct Address : JSONJoy {
  let city: String
  let geo: GeoPosition
  let street: String
  let suite: String
  let zipcode: String
  
  init(_ decoder: JSONDecoder) throws {
    city = try decoder["city"].get()
    geo = try GeoPosition(decoder["geo"])
    street = try decoder["street"].get()
    suite = try decoder["suite"].get()
    zipcode = try decoder["zipcode"].get()
  }
}

struct GeoPosition : JSONJoy {
  let lat: String
  let lng: String
  
  init(_ decoder: JSONDecoder) throws {
    lat = try decoder["lat"].get()
    lng = try decoder["lng"].get()
  }
}

struct Company : JSONJoy {
  let bs: String
  let catchPhrase: String
  let name: String
  
  init(_ decoder: JSONDecoder) throws {
    bs = try decoder["bs"].get()
    catchPhrase = try decoder["catchPhrase"].get()
    name = try decoder["catchPhrase"].get()
  }
}
