// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDUser.swift instead.

import Foundation
import CoreData

public enum CDUserAttributes: String {
    case email = "email"
    case id = "id"
    case name = "name"
    case phone = "phone"
    case username = "username"
    case website = "website"
}

public enum CDUserRelationships: String {
    case address = "address"
    case albums = "albums"
    case company = "company"
    case todos = "todos"
}

open class _CDUser: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "CDUser"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _CDUser.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var email: String?

    @NSManaged open
    var id: NSNumber?

    @NSManaged open
    var name: String?

    @NSManaged open
    var phone: String?

    @NSManaged open
    var username: String?

    @NSManaged open
    var website: String?

    // MARK: - Relationships

    @NSManaged open
    var address: CDAddress?

    @NSManaged open
    var albums: NSSet

    open func albumsSet() -> NSMutableSet {
        return self.albums.mutableCopy() as! NSMutableSet
    }

    @NSManaged open
    var company: CDCompany?

    @NSManaged open
    var todos: NSSet

    open func todosSet() -> NSMutableSet {
        return self.todos.mutableCopy() as! NSMutableSet
    }

    class func fetchAllUsers(managedObjectContext: NSManagedObjectContext) -> [Any]? {
        return self.fetchAllUsers(managedObjectContext: managedObjectContext, error: nil)
    }

    class func fetchAllUsers(managedObjectContext: NSManagedObjectContext, error outError: NSErrorPointer) -> [Any]? {
        guard let psc = managedObjectContext.persistentStoreCoordinator else { return nil }
        let model = psc.managedObjectModel
        let substitutionVariables : [String : Any] = [:]

        guard let fetchRequest = model.fetchRequestFromTemplate(withName: "AllUsers", substitutionVariables: substitutionVariables) else {
        	assert(false, "Can't find fetch request named \"AllUsers\".")
		return nil
	}
        var results = Array<Any>()
        do {
             results = try managedObjectContext.fetch(fetchRequest)
        } catch {
          print("Error executing fetch request: \(error)")
        }

        return results
    }

}

extension _CDUser {

    open func addAlbums(_ objects: NSSet) {
        let mutable = self.albums.mutableCopy() as! NSMutableSet
        mutable.union(objects as Set<NSObject>)
        self.albums = mutable.copy() as! NSSet
    }

    open func removeAlbums(_ objects: NSSet) {
        let mutable = self.albums.mutableCopy() as! NSMutableSet
        mutable.minus(objects as Set<NSObject>)
        self.albums = mutable.copy() as! NSSet
    }

    open func addAlbumsObject(_ value: CDAlbum) {
        let mutable = self.albums.mutableCopy() as! NSMutableSet
        mutable.add(value)
        self.albums = mutable.copy() as! NSSet
    }

    open func removeAlbumsObject(_ value: CDAlbum) {
        let mutable = self.albums.mutableCopy() as! NSMutableSet
        mutable.remove(value)
        self.albums = mutable.copy() as! NSSet
    }

}

extension _CDUser {

    open func addTodos(_ objects: NSSet) {
        let mutable = self.todos.mutableCopy() as! NSMutableSet
        mutable.union(objects as Set<NSObject>)
        self.todos = mutable.copy() as! NSSet
    }

    open func removeTodos(_ objects: NSSet) {
        let mutable = self.todos.mutableCopy() as! NSMutableSet
        mutable.minus(objects as Set<NSObject>)
        self.todos = mutable.copy() as! NSSet
    }

    open func addTodosObject(_ value: CDToDo) {
        let mutable = self.todos.mutableCopy() as! NSMutableSet
        mutable.add(value)
        self.todos = mutable.copy() as! NSSet
    }

    open func removeTodosObject(_ value: CDToDo) {
        let mutable = self.todos.mutableCopy() as! NSMutableSet
        mutable.remove(value)
        self.todos = mutable.copy() as! NSSet
    }

}

