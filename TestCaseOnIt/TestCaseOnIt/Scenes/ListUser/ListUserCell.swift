//
//  ListUserCell.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 4/12/16.
//  Copyright © 2016 Oscar. All rights reserved.
//

import UIKit

class ListUserCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var websideLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    open func configCell(_ name: String, email : String, webside : String) {
        
        nameLabel?.text = name
        emailLabel?.text = email
        websideLabel?.text = webside
        
    }
}
