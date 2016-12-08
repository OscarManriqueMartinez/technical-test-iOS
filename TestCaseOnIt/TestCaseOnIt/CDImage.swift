import Foundation
import CoreData

@objc(CDImage)
open class CDImage: _CDImage {
	// Custom logic goes here.
  
  convenience init?(image: Image, insertInto context: NSManagedObjectContext){
    
    self.init(managedObjectContext: context)
    
    self.albumId = NSNumber(value:image.albumId)
    self.id = NSNumber(value:image.id)
    self.title = image.title
    self.url = image.url
    self.thumbnailUrl = image.thumbnailUrl
  }
}
