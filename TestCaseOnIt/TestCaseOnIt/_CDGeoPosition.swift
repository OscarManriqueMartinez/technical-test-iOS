// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDGeoPosition.swift instead.

import Foundation
import CoreData

public enum CDGeoPositionAttributes: String {
    case lat = "lat"
    case lng = "lng"
}

open class _CDGeoPosition: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "CDGeoPosition"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _CDGeoPosition.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var lat: String?

    @NSManaged open
    var lng: String?

    // MARK: - Relationships

}

