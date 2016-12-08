// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDImage.swift instead.

import Foundation
import CoreData

public enum CDImageAttributes: String {
    case albumId = "albumId"
    case id = "id"
    case thumbnailUrl = "thumbnailUrl"
    case title = "title"
    case url = "url"
}

public enum CDImageRelationships: String {
    case album = "album"
}

open class _CDImage: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "CDImage"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _CDImage.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var albumId: NSNumber?

    @NSManaged open
    var id: NSNumber?

    @NSManaged open
    var thumbnailUrl: String?

    @NSManaged open
    var title: String?

    @NSManaged open
    var url: String?

    // MARK: - Relationships

    @NSManaged open
    var album: CDAlbum?

}

