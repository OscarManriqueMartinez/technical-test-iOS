import Foundation
import CoreData

@objc(CDAlbum)
open class CDAlbum: _CDAlbum {
	// Custom logic goes here.
  
  convenience init?(album: Album, insertInto context: NSManagedObjectContext){
    
    self.init(managedObjectContext: context)
    
    self.title = album.title
    self.userId = NSNumber(value:album.userId)
    self.id = NSNumber(value:album.id)
  }
}
