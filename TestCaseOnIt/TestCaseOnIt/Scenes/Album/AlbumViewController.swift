//
//  AlbumViewController.swift
//  TestCaseOnIt
//
//  Created by Oscar Manrique Martinez on 6/12/16.
//  Copyright (c) 2016 Oscar. All rights reserved.
//
//

import UIKit

protocol AlbumViewControllerInput
{
  func displayImages(viewModel: AlbumViewModel)
  func displayError(description: String)
}

protocol AlbumViewControllerOutput
{
  func loadImage()
  var album: Album! { get set }
}

class AlbumViewController: UICollectionViewController, AlbumViewControllerInput
{
  var output: AlbumViewControllerOutput!
  var router: AlbumRouter!
  
  @IBOutlet weak var errorLabel: UILabel!
  var imagesUrl = [String]()
  
  // MARK: - Object lifecycle
  
  override func awakeFromNib()
  {
    super.awakeFromNib()
    AlbumConfigurator.sharedInstance.configure(viewController: self)
    self.title = NSLocalizedString("album.title", comment: "")
  }
  
  // MARK: - View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    configView()
    loadImageOnLoad()
  }
  
  func configView(){
    
    let screenSize = UIScreen.main.bounds
    let screenWidth = screenSize.width
    
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    let rest = Int(screenWidth) % 150
    let value = Int(screenWidth) / 150
    let margin = CGFloat(rest/(value+1))
    layout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    layout.itemSize = CGSize(width: 150, height: 150)
    layout.minimumInteritemSpacing = margin
    layout.minimumLineSpacing = margin
    collectionView!.collectionViewLayout = layout
  }
  
  override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval){
    
    configView()
  }
  
  // MARK: - Event handling
  
  func loadImageOnLoad()
  {
    output.loadImage()
  }
  
  // MARK: - Display logic
  
  func displayImages(viewModel: AlbumViewModel)
  {
    imagesUrl = viewModel.imagesUrl
    collectionView?.reloadData()
  }
  
  func displayError(description: String){
    
    self.errorLabel.isHidden = false
    self.errorLabel?.text = description
  }
  
  // MARK: - Collection view data source
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return imagesUrl.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCell
    cell.configCell(imagesUrl[(indexPath as NSIndexPath).row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 150, height: 150)
  }

}
