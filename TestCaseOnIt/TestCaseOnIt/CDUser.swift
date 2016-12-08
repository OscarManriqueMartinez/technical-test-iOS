import Foundation
import CoreData

@objc(CDUser)
open class CDUser: _CDUser {
	// Custom logic goes here.
  
  
  convenience init?(user: User, insertInto context: NSManagedObjectContext){
    
    self.init(managedObjectContext: context)
    
    self.name = user.name
    self.phone = user.phone
    self.username = user.username
    self.id = NSNumber(value:user.id)
    self.email = user.email
    self.website = user.website
    
    self.address = CDAddress(address: user.address, insertInto: context)
    self.company = CDCompany(company: user.company, insertInto: context)
    
  }

}
