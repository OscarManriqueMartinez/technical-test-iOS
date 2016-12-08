import Foundation
import CoreData

@objc(CDCompany)
open class CDCompany: _CDCompany {
	// Custom logic goes here.
  
  convenience init?(company: Company, insertInto context: NSManagedObjectContext){
    
    self.init(managedObjectContext: context)
    
    self.bs = company.bs
    self.catchPhrase = company.catchPhrase
    self.name = company.name
  }
}
