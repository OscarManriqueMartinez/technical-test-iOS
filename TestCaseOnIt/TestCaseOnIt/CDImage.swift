import Foundation
import CoreData

@objc(CDImage)
open class CDImage: _CDImage {
	// Custom logic goes here.
  
  convenience init?(image: Image, album: Album, insertInto context: NSManagedObjectContext){
    
    self.init(managedObjectContext: context)
    
    self.id = NSNumber(value:image.id)
    self.title = image.title
    self.url = image.url
    self.thumbnailUrl = image.thumbnailUrl
    self.album = CDAlbum(album: album, insertInto: context)
  }
}
