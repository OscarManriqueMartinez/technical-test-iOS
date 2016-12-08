import Foundation
import CoreData

@objc(CDToDo)
open class CDToDo: _CDToDo {
	// Custom logic goes here.

  convenience init?(toDo: ToDo, user: User, insertInto context: NSManagedObjectContext){
    
    self.init(managedObjectContext: context)
    
    self.id = NSNumber(value:toDo.id)
    self.title = toDo.title
    self.completed = NSNumber(value:toDo.completed)
    self.user = CDUser(user: user, insertInto: context)
  }

}
