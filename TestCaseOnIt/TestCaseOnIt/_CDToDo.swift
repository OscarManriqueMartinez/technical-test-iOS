// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDToDo.swift instead.

import Foundation
import CoreData

public enum CDToDoAttributes: String {
    case completed = "completed"
    case id = "id"
    case title = "title"
    case userId = "userId"
}

public enum CDToDoRelationships: String {
    case user = "user"
}

open class _CDToDo: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "CDToDo"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _CDToDo.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var completed: NSNumber?

    @NSManaged open
    var id: NSNumber?

    @NSManaged open
    var title: String?

    @NSManaged open
    var userId: NSNumber?

    // MARK: - Relationships

    @NSManaged open
    var user: CDUser?

}

