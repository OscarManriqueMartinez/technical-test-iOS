//
//  MainButton.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 6/12/16.
//  Copyright © 2016 Oscar. All rights reserved.
//

import UIKit

class MainButton: UIButton {

  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.backgroundColor = UIColor().mainColor()
    self.layer.cornerRadius = 4.0
    setTitleColor(UIColor.white, for: .normal)
    
  }
}
