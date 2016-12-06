//
//  ToDoCell.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 4/12/16.
//  Copyright © 2016 Oscar. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {

  @IBOutlet weak var title: UILabel!

  open func configCell(_ title: String) {
    
    self.title.text = title
    
  }
}
