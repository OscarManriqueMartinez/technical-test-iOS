import Foundation
import CoreData

@objc(CDToDo)
open class CDToDo: _CDToDo {
	// Custom logic goes here.

  convenience init?(toDo: ToDo, insertInto context: NSManagedObjectContext){
    
    self.init(managedObjectContext: context)
    
    self.userId = NSNumber(value:toDo.userId)
    self.id = NSNumber(value:toDo.id)
    self.title = toDo.title
    self.completed = NSNumber(value:toDo.completed)
    
  }

}
