// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDCompany.swift instead.

import Foundation
import CoreData

public enum CDCompanyAttributes: String {
    case bs = "bs"
    case catchPhrase = "catchPhrase"
    case name = "name"
}

open class _CDCompany: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "CDCompany"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _CDCompany.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var bs: String?

    @NSManaged open
    var catchPhrase: String?

    @NSManaged open
    var name: String?

    // MARK: - Relationships

}

