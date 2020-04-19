//
//  Category.swift
//  Creative Kitchen
//
//  Created by Maxwell Anselm on 4/18/20.
//  Copyright © 2020 Max. All rights reserved.
//

import CoreData

class Category: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: String(describing: self))
    }

    @NSManaged public var name: String
    @NSManaged public var sortOrder: Int16
    @NSManaged public var options: Set<Option>

    convenience init(name: String, sortOrder: Int16, in context: NSManagedObjectContext) {
        let entity = NSEntityDescription.entity(forEntityName: String(describing: type(of: self)), in: context)!
        self.init(entity: entity, insertInto: context)
        self.name = name
        self.sortOrder = sortOrder
    }
}
