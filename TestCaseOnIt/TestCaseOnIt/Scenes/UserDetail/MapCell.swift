//
//  MapCell.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 6/12/16.
//  Copyright © 2016 Oscar. All rights reserved.
//

import UIKit

class MapCell: UITableViewCell {

  @IBOutlet weak var usernameValue: UILabel!
  @IBOutlet weak var usernameDescription: UILabel!
  @IBOutlet weak var phoneValue: UILabel!
  @IBOutlet weak var phoneDescription: UILabel!
  @IBOutlet weak var companyValue: UILabel!
  @IBOutlet weak var companyDescription: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()

    usernameDescription.text = NSLocalizedString("userDetail.username", comment: "")
    phoneDescription.text = NSLocalizedString("userDetail.phone", comment: "")
    companyDescription.text = NSLocalizedString("userDetail.company", comment: "")
    
    usernameValue.adjustsFontSizeToFitWidth = true;
    phoneValue.adjustsFontSizeToFitWidth = true;
    companyValue.adjustsFontSizeToFitWidth = true;
  }
  
  open func configCell(_ username: String, phone: String, company: String) {
    
    usernameValue.text = username
    phoneValue.text = phone
    companyValue.text = company
  }
}
