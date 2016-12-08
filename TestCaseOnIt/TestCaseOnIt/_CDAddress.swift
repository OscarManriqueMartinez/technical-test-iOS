// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDAddress.swift instead.

import Foundation
import CoreData

public enum CDAddressAttributes: String {
    case city = "city"
    case street = "street"
    case suite = "suite"
    case zipcode = "zipcode"
}

public enum CDAddressRelationships: String {
    case geo = "geo"
}

open class _CDAddress: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "CDAddress"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _CDAddress.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var city: String?

    @NSManaged open
    var street: String?

    @NSManaged open
    var suite: String?

    @NSManaged open
    var zipcode: String?

    // MARK: - Relationships

    @NSManaged open
    var geo: CDGeoPosition?

}

