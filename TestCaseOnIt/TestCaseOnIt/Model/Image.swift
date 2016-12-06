//
//  Image.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 6/12/16.
//  Copyright © 2016 Oscar. All rights reserved.
//

import JSONJoy


struct Image : JSONJoy {
  
  let albumId: Int
  let id: Int
  let title: String
  let url: String
  let thumbnailUrl: String
  
  init(_ decoder: JSONDecoder) throws {
    
    albumId = try decoder["albumId"].get()
    id = try decoder["id"].get()
    title = try decoder["title"].get()
    url = try decoder["url"].get()
    thumbnailUrl = try decoder["thumbnailUrl"].get()
  }
}
