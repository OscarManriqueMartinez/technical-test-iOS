import Foundation
import CoreData


@objc(CDGeoPosition)
open class CDGeoPosition: _CDGeoPosition {
	// Custom logic goes here.
  
  
  convenience init?(geo: GeoPosition, insertInto context: NSManagedObjectContext){
    
    self.init(managedObjectContext: context)

    self.lat = geo.lat
    self.lng = geo.lng
  }
}
