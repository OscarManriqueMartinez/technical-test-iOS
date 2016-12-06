//
//  Album.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 6/12/16.
//  Copyright © 2016 Oscar. All rights reserved.
//


import JSONJoy


struct Album : JSONJoy {
  
  let userId: Int
  let id: Int
  let title: String
  
  
  init(_ decoder: JSONDecoder) throws {
    
    userId = try decoder["userId"].get()
    id = try decoder["id"].get()
    title = try decoder["title"].get()
  }
}
