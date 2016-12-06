//
//  ImageCell.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 6/12/16.
//  Copyright © 2016 Oscar. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
 
  @IBOutlet weak var imageView: UIImageView!
  
  open func configCell(_ imageUrl: String) {
    
    imageView.downloadedFrom(link: imageUrl)
  }
}
