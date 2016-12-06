//
//  AlbumHeaderCell.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 6/12/16.
//  Copyright © 2016 Oscar. All rights reserved.
//

import UIKit

class AlbumHeaderCell: UITableViewCell {

  @IBOutlet weak var title: UILabel!
  
  open func configCell(_ title: String) {
    
    self.title.text = title
    
  }
}
