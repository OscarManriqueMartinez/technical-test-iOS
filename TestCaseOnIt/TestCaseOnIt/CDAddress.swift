import Foundation
import CoreData

@objc(CDAddress)
open class CDAddress: _CDAddress {
	// Custom logic goes here.
  
  convenience init?(address: Address, insertInto context: NSManagedObjectContext){
    
    self.init(managedObjectContext: context)
    
    self.city = address.city
    self.street = address.street
    self.suite = address.suite
    self.zipcode = address.zipcode
    
    self.geo = CDGeoPosition(geo: address.geo, insertInto: context)
  }
}
