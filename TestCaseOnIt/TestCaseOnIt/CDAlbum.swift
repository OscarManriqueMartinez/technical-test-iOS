import Foundation
import CoreData

@objc(CDAlbum)
open class CDAlbum: _CDAlbum {
	// Custom logic goes here.
  
  convenience init?(album: Album, user: User, insertInto context: NSManagedObjectContext){
    
    self.init(managedObjectContext: context)
    
    self.title = album.title
    self.id = NSNumber(value:album.id)
    self.user = CDUser(user: user, insertInto: context)
  }
}
